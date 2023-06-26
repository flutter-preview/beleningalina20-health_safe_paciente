import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/database/turno_service.dart'
    as database;
import 'package:health_safe_paciente/src/services/api/constants/environments.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';

class TurnoService {
  Future crearTurno(CrearTurnoRequest params) async {
    try {
      final resp = await http
          .post(Uri.parse("${Environments.apiUrl}/turnos"),
              body: params.request())
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      TurnoPaciente turno = CrearTurnoResponse.fromJson(response).turno;

      // TODO Push notification al profesional
      // Post de la mensajeria

      database.TurnoService()
          .guardarTurno(TurnoPacienteDto.fromApi(turno).toEntity());
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Turno>> obtenerTurnos(int idPaciente) async {
    return []; /*await _obtenerTurnosService(idPaciente).then((value) {
      return value.turnos;
    }).onError((Exception error, stackTrace) => throw error);*/
  }

  /*Future<ObtenerTurnosResponse> _obtenerTurnosService(int idPaciente) async {
    try {
      /*final resp = await http
          .get(Uri.parse(BaseEndpoints.obtenerTurnosPorPaciente))
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return ObtenerTurnosResponse.fromJson(response);*/
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }*/
}
