import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/extra/mappers.dart';
import 'package:health_safe_paciente/src/services/api/constants/base_endpoints.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_utils.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class ModalidadAtencionApiService {
  static final ModalidadAtencionApiService modalidadAtencionService =
      ModalidadAtencionApiService._();
  ModalidadAtencionApiService._();

  List<ModalidadAtencionDto>? _modadalidadesAtencion;

  Future<List<ModalidadAtencionDto>?> get modalidadesAtencion async {
    _modadalidadesAtencion ??= await obtenerModalidadesAtencion();
    return _modadalidadesAtencion;
  }

  Future<List<ModalidadAtencionDto>?> obtenerModalidadesAtencion() async {
    return await obtenerModalidadesAtencionService().then((value) {
      return value.modalidadesAtencion
          .map((modalidadAtencion) =>
              ConvertModalidadAtencionToModalidadAtencionDto.convert(
                  modalidadAtencion))
          .toList();
    }).onError((Exception error, stackTrace) {
      throw error;
    });
  }

  Future<ObtenerModalidadesAtencionResponse>
      obtenerModalidadesAtencionService() async {
    try {
      final resp = await http
          .get(Uri.parse(BaseEndpoints.obtenerModalidadesAtencion))
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return ObtenerModalidadesAtencionResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
