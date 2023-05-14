import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/extra/mappers.dart';
import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/services/database/database_services.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';
import 'package:health_safe_paciente/src/services/api/constants/base_endpoints.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';

class TurnoApiService {
  Future crearTurno(TurnoDto turno) async {
    return await _crearTurnoService(turno).then((value) {
      // TODO enviar la notificacion al profesional

      TurnoDatabaseService()
          .guardarTurno(ConvertTurnoDtoToTurnoEntity.convert(turno));
      return null;
    }).onError((Exception error, stackTrace) => throw error);
  }

  Future<List<TurnoDto>> obtenerTurnos(int idPaciente) async {
    return await _obtenerTurnosService(idPaciente).then((value) {
      return value.turnos
          .map((turno) => ConvertTurnoToTurnoDto.convert(turno))
          .toList();
    }).onError((Exception error, stackTrace) => throw error);
  }

  Future<CrearTurnoResponse> _crearTurnoService(TurnoDto turno) async {
    try {
      final resp = await http
          .post(Uri.parse(BaseEndpoints.crearTurno), body: turno.toJson())
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return CrearTurnoResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }

  Future<ObtenerTurnosResponse> _obtenerTurnosService(int idPaciente) async {
    try {
      final resp = await http
          .get(Uri.parse(BaseEndpoints.obtenerTurnosPorPaciente))
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return ObtenerTurnosResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
