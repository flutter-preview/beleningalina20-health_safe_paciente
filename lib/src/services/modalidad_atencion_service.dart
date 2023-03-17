import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/mocks/obtener_modalidades_atencion_response_mock.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/responses/obtener_modalidades_atencion_response.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/services/utils/environments.dart';

class ModalidadAtencionService {
  static final ModalidadAtencionService modalidadAtencionService =
      ModalidadAtencionService._();
  ModalidadAtencionService._();

  List<ModalidadAtencion>? _modadalidadesAtencion;

  Future<List<ModalidadAtencion>?> get modalidadesAtencion async {
    _modadalidadesAtencion ??= await obtenerModalidadesAtencion();
    return _modadalidadesAtencion;
  }

  Future<List<ModalidadAtencion>?> obtenerModalidadesAtencion() async {
    return await obtenerModalidadesAtencionService().then((value) {
      return value.modalidadesAtencion;
    }).onError((Exception error, stackTrace) {
      throw error;
    });
  }

  Future<ObtenerModalidadesAtencionResponse>
      obtenerModalidadesAtencionService() async {
    late Map<String, dynamic> response;
    Uri url = Uri.parse('${Environments.apiUrl}/modalidadesAtencion/');

    try {
      return obtenerModalidadesAtencionResponseMock;
      final resp = await http.get(url).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return ObtenerModalidadesAtencionResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
