import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/api/rol_service.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/constants/environments.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';

class UsuarioService {
  Future<UsuarioDto> registro(RegistroUsuarioRequest params) async {
    try {
      final roles = await RolService().obtenerRoles();
      RolDto rolPaciente =
          roles.where((rol) => rol.descripcion == "Paciente").first;

      params.idRol = rolPaciente.id;

      http.MultipartRequest request = http.MultipartRequest(
          "post", Uri.parse('${Environments.apiUrl}/usuarios/'))
        ..fields.addAll(params.toJson())
        ..files.addAll([
          await http.MultipartFile.fromPath(
              'imgperfil', params.imagenPerfil.path),
          await http.MultipartFile.fromPath(
              'imgdnifrente', params.imagenDniFrente.path),
          await http.MultipartFile.fromPath(
              'imgdnidorso', params.imagenDniDorso.path)
        ]);

      http.StreamedResponse streamResponse =
          await request.send().timeout(const Duration(seconds: 10));
      http.Response resp = await http.Response.fromStream(streamResponse);

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      Usuario usuario = RegistroUsuarioResponse.fromJson(response).usuario;

      return UsuarioDto.fromApi(usuario);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
