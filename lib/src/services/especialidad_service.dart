import 'dart:io';
// import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/mocks/obtenes_especialidades_response_mock.dart';
// import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/models.dart';
// import 'package:health_safe_paciente/src/models/responses/obtener_especialidades_response.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';
// import 'package:health_safe_paciente/src/services/utils/api_response_mapper.dart';
// import 'package:health_safe_paciente/src/services/utils/environments.dart';

class EspecialidadService {
  static final EspecialidadService especialidadService =
      EspecialidadService._();
  EspecialidadService._();

  List<Especialidad>? _especialidades;

  Future<List<Especialidad>?> get especialidades async {
    _especialidades ??= await obtenerEspecialidades();
    return _especialidades;
  }

  Future<List<Especialidad>?> obtenerEspecialidades() async {
    return await obtenerEspecialidadesService().then((value) {
      return value.especialidades;
    }).onError((Exception error, stackTrace) {
      throw error;
    });
  }

  Future<ObtenerEspecialidadesResponse> obtenerEspecialidadesService() async {
    // late Map<String, dynamic> response;
    // Uri url = Uri.parse('${Environments.apiUrl}/especialidades/');

    try {
      return obtenerEspecialidadesResponseMock;
      /*final resp = await http.get(url).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return ObtenerEspecialidadesResponse.fromJson(response);*/
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
