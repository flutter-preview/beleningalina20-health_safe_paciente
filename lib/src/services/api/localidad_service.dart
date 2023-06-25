import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/constants/environments.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';

class LocalidadService {
  static final LocalidadService localidadService = LocalidadService._();
  LocalidadService._();

  List<LocalidadDto>? _localidades;

  Future<List<LocalidadDto>?> get localidades async {
    _localidades ??= await obtenerLocalidades();
    return _localidades;
  }

  Future<List<LocalidadDto>?> obtenerLocalidades() async {
    try {
      final resp = await http
          .get(Uri.parse("${Environments.apiUrl}/localidades"))
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      List<Localidad> localidades =
          ObtenerLocalidadesResponse.fromJson(response).localidades;

      return List<LocalidadDto>.from(
          localidades.map((localidad) => LocalidadDto.fromApi(localidad)));
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
