import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/mocks/obtener_agendas_turnos_response_mock.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';
// import 'package:health_safe_paciente/src/services/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/models/models.dart';
// import 'package:health_safe_paciente/src/services/utils/environments.dart';

class AgendaTurnosService {
  Future<List<AgendaTurnos>> obtenerAgendasTurnos(
      Profesional profesional) async {
    return await obtenerAgendasTurnosService(profesional).then((value) {
      return value.agendasTurnos;
    }).onError((Exception error, stackTrace) {
      throw error;
    });
  }

  Future<ObtenerAgendasTurnosResponse> obtenerAgendasTurnosService(
      Profesional profesional) async {
    // late Map<String, dynamic> response;
    // Uri url = Uri.parse(
    // '${Environments.apiUrl}/agendas/profesional/${profesional.id}?fecha=${DateTime.now()}');
    // TODO Posible error con la fecha y el formato de datetime.now

    try {
      return obtenerAgendasTurnosResponseMock;
      /*final resp = await http.get(url).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return ObtenerAgendasTurnosResponse.fromJson(response);*/
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
