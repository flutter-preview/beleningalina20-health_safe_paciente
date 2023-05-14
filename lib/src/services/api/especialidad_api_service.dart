import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/extra/convert_especialidad.dart';
import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/services/api/constants/base_endpoints.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_utils.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class EspecialidadApiService {
  static final EspecialidadApiService especialidadService =
      EspecialidadApiService._();
  EspecialidadApiService._();

  List<EspecialidadDto>? _especialidades;

  Future<List<EspecialidadDto>?> get especialidades async {
    _especialidades ??= await obtenerEspecialidades();
    return _especialidades;
  }

  Future<List<EspecialidadDto>?> obtenerEspecialidades() async {
    return await obtenerEspecialidadesService().then((value) {
      return value.especialidades
          .map((especialidad) =>
              ConvertEspecialidadToEspecialidadDto.convert(especialidad))
          .toList();
    }).onError((Exception error, stackTrace) {
      throw error;
    });
  }

  Future<ObtenerEspecialidadesResponse> obtenerEspecialidadesService() async {
    try {
      final resp = await http
          .get(Uri.parse(BaseEndpoints.obtenerEspecialidades))
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return ObtenerEspecialidadesResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
