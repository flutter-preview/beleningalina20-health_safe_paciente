import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/constants/base_endpoints.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/helpers/utils/local_storage_manager.dart';

class UsuarioApiService extends ChangeNotifier {
  Usuario? _usuario;

  Usuario? get usuario => _usuario;
  set usuario(Usuario? value) {
    _usuario = value;
    notifyListeners();
  }

  Future registro(Map<String, String> data, File imagenPerfil,
      File imagenDniFrente, File imagenDniDorso) async {
    await registroService(data, imagenPerfil, imagenDniFrente, imagenDniDorso)
        .then((value) {
      usuario = value.usuario;
      LocalStorage.localStorage.setToken(value.token);
    }).onError((Exception error, stackTrace) {
      throw error;
    });
  }

  Future<RegistroUsuarioResponse> registroService(Map<String, String> data,
      File imagenPerfil, File imagenDniFrente, File imagenDniDorso) async {
    try {
      http.MultipartRequest request = http.MultipartRequest(
          "post", Uri.parse(BaseEndpoints.registroUsuario))
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

      Map<String, dynamic> response = apiResponseMapper(resp);

      return RegistroUsuarioResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
