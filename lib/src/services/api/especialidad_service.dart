import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/constants/environments.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';

class EspecialidadService {
  static final EspecialidadService especialidadService =
      EspecialidadService._();
  EspecialidadService._();

  List<EspecialidadDto>? _especialidades;

  Future<List<EspecialidadDto>?> get especialidades async {
    _especialidades ??= await obtenerEspecialidades();
    return _especialidades;
  }

  Future<List<EspecialidadDto>?> obtenerEspecialidades() async {
    try {
      final resp =
          await http.get(Uri.parse("${Environments.apiUrl}/especialidades"));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      List<Especialidad> especialidades =
          ObtenerEspecialidadesResponse.fromJson(response).especialidades;

      return List<EspecialidadDto>.from(especialidades
          .map((especialidad) => EspecialidadDto.fromApi(especialidad)));
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
