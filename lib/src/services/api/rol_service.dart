import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/constants/environments.dart';

class RolService {
  Future<List<RolDto>> obtenerRoles() async {
    try {
      final resp = await http.get(Uri.parse("${Environments.apiUrl}/roles"));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      List<Rol> roles = ObtenerRolesResponse.fromJson(response).roles;

      return List<RolDto>.from(roles.map((rol) => RolDto.fromApi(rol)));
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
