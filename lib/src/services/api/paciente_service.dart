import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/services/api/constants/environments.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';

class PacienteService {
  Future<void> registro(RegistroPacienteRequest params) async {
    try {
      final resp = await http.post(
          Uri.parse('${Environments.apiUrl}/pacientes'),
          body: params.request(),
          headers: {'Content-Type': 'application/json'});

      debugPrint(resp.body);

      apiResponseMapper(resp);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }

  Future<PacienteDto> obtenerPaciente(int idUsuario) async {
    try {
      final resp = await http.get(
          Uri.parse('${Environments.apiUrl}/pacientes/usuario/$idUsuario'),
          headers: {'Content-Type': 'application/json'});

      debugPrint(resp.body);

      Map<String, dynamic> response = apiResponseMapper(resp);

      Paciente paciente = Paciente.fromJson(response);

      return PacienteDto.fromApi(paciente);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
