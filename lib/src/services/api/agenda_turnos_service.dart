import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/agenda_turnos_dto.dart';
import 'package:health_safe_paciente/src/services/api/constants/environments.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';

class AgendaTurnosService {
  Future<List<AgendaTurnosDto>> obtenerAgendasTurnos(int idProfesional) async {
    try {
      final resp = await http.get(Uri.parse(
          '${Environments.apiUrl}/agendas/profesional/$idProfesional'));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      List<AgendaTurnos> agendasTurnos =
          ObtenerAgendasTurnosResponse.fromJson(response).agendasTurnos;

      return List<AgendaTurnosDto>.from(agendasTurnos
          .map((agendaTurnos) => AgendaTurnosDto.fromApi(agendaTurnos)));
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
