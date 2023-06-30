import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/local_storage_manager.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/services/api/models/response/registro_paciente_response.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/services/api/constants/environments.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:provider/provider.dart';

class PacienteService {
  Future<PacienteDto> registro(RegistroPacienteRequest params) async {
    try {
      final resp = await http.post(
          Uri.parse('${Environments.apiUrl}/pacientes'),
          body: params.request(),
          headers: {'Content-Type': 'application/json'});

      debugPrint(resp.body);

      Map<String, dynamic> response = apiResponseMapper(resp);

      RegistroPacienteResponse registroPacienteResponse =
          RegistroPacienteResponse.fromJson(response);

      LocalStorage.localStorage.setToken(registroPacienteResponse.token);
      return PacienteDto.fromApi(registroPacienteResponse.paciente);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
