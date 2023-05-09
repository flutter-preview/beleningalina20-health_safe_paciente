import 'dart:io';
// import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/mocks/crear_turno_response_mock.dart';
// import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/database/local_service.dart';
import 'package:health_safe_paciente/src/models/mappers/mappers.dart';
import 'package:health_safe_paciente/src/services/mocks/obtener_turnos_response_mock.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';
// import 'package:health_safe_paciente/src/services/utils/environments.dart';
// import 'package:health_safe_paciente/src/services/utils/api_response_mapper.dart';

class TurnoService {
  Future crearTurno(Map<String, String> data) async {
    return await _crearTurnoService(data).then((value) {
      // TODO enviar la notificacion al profesinoal
      TurnoLocalService().guardarTurno(ConvertTurno.convert(value.turno));
      return null;
    }).onError((Exception error, stackTrace) => throw error);
  }

  Future<List<Turno>> obtenerTurnos(int idPaciente) async {
    return await _obtenerTurnosService(idPaciente)
        .then((value) => value.turnos)
        .onError((Exception error, stackTrace) => throw error);
  }

  Future<CrearTurnoResponse> _crearTurnoService(
      Map<String, String> data) async {
    // late Map<String, dynamic> response;
    // Uri url = Uri.parse('${Environments.apiUrl}/turnos');

    try {
      return crearTurnoResponseMock;
      /*final resp =
          await http.post(url, body: data).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return CrearTurnoResponse.fromJson(response);*/
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }

  Future<ObtenerTurnosResponse> _obtenerTurnosService(int idPaciente) async {
    // late Map<String, dynamic> response;
    // Uri url = Uri.parse('${Environments.apiUrl}/turnos/paciente/$idPaciente');

    try {
      return obtenreTurnosResponseMock;
      /*final resp = await http.get(url).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return ObtenerTurnosResponse.fromJson(response);*/
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
