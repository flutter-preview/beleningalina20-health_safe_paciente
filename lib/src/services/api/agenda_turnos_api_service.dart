import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/extra/convert_agenda_turnos.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/constants/base_endpoints.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_utils.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class AgendaTurnosApiService {
  Future<List<AgendaTurnosDto>> obtenerAgendasTurnos(int idProfesional) async {
    return await obtenerAgendasTurnosService(idProfesional).then((value) {
      return value.agendasTurnos
          .map((agendaTurnos) =>
              ConvertAgendaTurnosToAgendaTurnosDto.convert(agendaTurnos))
          .toList();
    }).onError((Exception error, stackTrace) {
      throw error;
    });
  }

  Future<ObtenerAgendasTurnosResponse> obtenerAgendasTurnosService(
      int idProfesional) async {
    try {
      final resp = await http
          .get(Uri.parse(
              '${BaseEndpoints.obtenerAgendasTurnosPorProfesional}/$idProfesional?fecha=${DateTime.now()}'))
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return ObtenerAgendasTurnosResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
