import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/constants/base_endpoints.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_utils.dart';

class LocalidadApiService {
  static final LocalidadApiService localidadService = LocalidadApiService._();
  LocalidadApiService._();

  List<Localidad>? _localidades;

  Future<List<Localidad>?> get localidades async {
    _localidades ??= await obtenerLocalidades();
    return _localidades;
  }

  Future<List<Localidad>?> obtenerLocalidades() async {
    return await obtenerLocalidadesService().then((value) {
      return value.localidades;
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
