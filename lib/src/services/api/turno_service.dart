import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/helpers/local_storage_manager.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
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
          });

      debugPrint(resp.body.toString());

      // Map<String, dynamic> response =
      apiResponseMapper(resp);

      // TurnoPaciente turno = CrearTurnoResponse.fromJson(response).turno;

      // TODO Push notification al profesional (idprofesional) / enviar mensaje con la url del la llamada
      // Desactivado hasta antes 10 minutos
      // url=https://meet.jit.si/turno_${id}_${dniPaciente}_hsA
      // Tipo de mensaje de llamada

      await MensajeriaService().crearMensajeria(CrearMensajeriaRequest(
          idPaciente: params.idPaciente, idProfesional: params.idProfesional));
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TurnoPacienteDto>> obtenerTurnos(int idPaciente) async {
    try {
      final resp = await http.get(
          Uri.parse('${Environments.apiUrl}/turnos/paciente/$idPaciente'),
          headers: {
            'Content-Type': 'application/json',
          });

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      List<TurnoPaciente> turnos =
          ObtenerTurnosResponse.fromJson(response).turnos;

      return List<TurnoPacienteDto>.from(
          turnos.map((turno) => TurnoPacienteDto.fromApi(turno)));
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
