import 'dart:io';
// import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/mocks/obtener_profesionales_mock.dart';
// import 'package:http/http.dart' as http;
// import 'package:health_safe_paciente/src/services/utils/api_response_mapper.dart';
// import 'package:health_safe_paciente/src/services/utils/environments.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';

class ProfesionalService {
  Future<List<Profesional>> obtenerProfesionales(
    Especialidad? especialidad,
    ModalidadAtencion? modalidadAtencion,
    Localidad? localidad,
  ) async {
    return await obtenerProfesionalesService(
            especialidad, modalidadAtencion, localidad)
        .then((value) {
      return value.profesionales;
    }).onError((Exception error, stackTrace) {
      throw error;
    });
  }

  Future<ObtenerProfesionalesResponse> obtenerProfesionalesService(
    Especialidad? especialidad,
    ModalidadAtencion? modalidadAtencion,
    Localidad? localidad,
  ) async {
    // late Map<String, dynamic> response;
    // Uri url = Uri.parse(
    // '${Environments.apiUrl}/profesionales?especialidad=${especialidad?.id}&&modalidadAtencion=${modalidadAtencion?.id}&&localidad=${localidad?.codigoPostal}');

    try {
      return obtenerProfesionalesResponseMock;
      /*final resp = await http.get(url).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return ObtenerProfesionalesResponse.fromJson(response);*/
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
