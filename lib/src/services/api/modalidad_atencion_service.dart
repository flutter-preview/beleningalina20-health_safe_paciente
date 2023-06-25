import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/constants/environments.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';

class ModalidadAtencionService {
  static final ModalidadAtencionService modalidadAtencionService =
      ModalidadAtencionService._();
  ModalidadAtencionService._();

  List<ModalidadAtencionDto>? _modadalidadesAtencion;

  Future<List<ModalidadAtencionDto>?> get modalidadesAtencion async {
    _modadalidadesAtencion ??= await obtenerModalidadesAtencion();
    return _modadalidadesAtencion;
  }

  Future<List<ModalidadAtencionDto>?> obtenerModalidadesAtencion() async {
    try {
      final resp =
          await http.get(Uri.parse("${Environments.apiUrl}/modalidades"));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      List<ModalidadAtencion> modalidadesAtencion =
          ObtenerModalidadesAtencionResponse.fromJson(response)
              .modalidadesAtencion;

      return List<ModalidadAtencionDto>.from(modalidadesAtencion.map(
          (modalidadAtencion) =>
              ModalidadAtencionDto.fromApi(modalidadAtencion)));
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
