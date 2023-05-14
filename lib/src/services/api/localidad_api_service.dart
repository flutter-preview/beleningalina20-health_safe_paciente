import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/extra/mappers.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';
import 'package:health_safe_paciente/src/services/api/constants/base_endpoints.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_utils.dart';

class LocalidadApiService {
  static final LocalidadApiService localidadService = LocalidadApiService._();
  LocalidadApiService._();

  List<LocalidadDto>? _localidades;

  Future<List<LocalidadDto>?> get localidades async {
    _localidades ??= await obtenerLocalidades();
    return _localidades;
  }

  Future<List<LocalidadDto>?> obtenerLocalidades() async {
    return await obtenerLocalidadesService().then((value) {
      return value.localidades
          .map((localidad) => ConvertLocalidadToLocalidadDto.convert(localidad))
          .toList();
    }).onError((Exception error, stackTrace) {
      throw error;
    });
  }

  Future<ObtenerLocalidadesResponse> obtenerLocalidadesService() async {
    try {
      final resp = await http
          .get(Uri.parse(BaseEndpoints.obtenerLocalidades))
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return ObtenerLocalidadesResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
