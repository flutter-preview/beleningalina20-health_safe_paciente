import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/models/responses/registro_usuario_response.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/services/utils/environments.dart';
import 'package:health_safe_paciente/src/services/utils/local_storage_manager.dart';

class UsuarioService extends ChangeNotifier {
  Usuario? _usuario;
  bool _isLoading = false;

  Usuario? get usuario => _usuario;
  set usuario(Usuario? value) {
    _usuario = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future registro(Map<String, String> data, File imagenPerfil,
      File imagenDniFrente, File imagenDniDorso) async {
    isLoading = true;

    await registroService(data, imagenPerfil, imagenDniFrente, imagenDniDorso)
        .then((value) {
      isLoading = false;
      usuario = value.usuario;
      LocalStorage.localStorage.setToken(value.token);
    }).onError((Exception error, stackTrace) {
      isLoading = false;
      throw error;
    });
  }

  Future<RegistroUsuarioResponse> registroService(Map<String, String> data,
      File imagenPerfil, File imagenDniFrente, File imagenDniDorso) async {
    late Map<String, dynamic> response;
    Uri url = Uri.parse('${Environments.apiUrl}/usuarios/');

    try {
      http.MultipartRequest request = http.MultipartRequest("post", url)
        ..fields.addAll(data)
        ..files.addAll([
          await http.MultipartFile.fromPath('imagenPerfil', imagenPerfil.path),
          await http.MultipartFile.fromPath(
              'imagenDniFrente', imagenDniFrente.path),
          await http.MultipartFile.fromPath(
              'imagenDniDorso', imagenDniDorso.path)
        ]);

      http.StreamedResponse streamResponse =
          await request.send().timeout(const Duration(seconds: 10));
      http.Response resp = await http.Response.fromStream(streamResponse);

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return RegistroUsuarioResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
