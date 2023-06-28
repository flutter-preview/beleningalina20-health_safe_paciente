import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/local_storage_manager.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
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
      String? token = await LocalStorage.localStorage.getToken();
      if (token == null) {
        throw ApiException(message: "No hay token guardado");
      }
      final resp = await http.post(Uri.parse("${Environments.apiUrl}/turnos"),
          body: params.request(),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': token
          }).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      TurnoPaciente turno = CrearTurnoResponse.fromJson(response).turno;

      // TODO Push notification al profesional - necesito el id del dispositivo del profesional

      await MensajeriaService().crearMensajeria(CrearMensajeriaRequest(
          idPaciente: params.idPaciente, idProfesional: params.idProfesional));

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
