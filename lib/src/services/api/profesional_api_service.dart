import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/extra/mappers.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';
import 'package:health_safe_paciente/src/services/api/constants/base_endpoints.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_utils.dart';

class ProfesionalApiService {
  Future<List<ProfesionalDto?>> obtenerProfesionales(
    int idEspecialidad,
    int idModalidadAtencion,
    int? idLocalidad,
  ) async {
    return await _obtenerProfesionalesService(
            idEspecialidad, idModalidadAtencion, idLocalidad)
        .then((value) {
      return value.profesionales
          .map((profesional) =>
              ConvertProfesionalToProfesionalDto.convert(profesional))
          .toList();
    }).onError((Exception error, stackTrace) {
      throw error;
    });
  }

  /*Future<List<Profesional>> obtenerProfesionalesTurnos(int idPaciente) async {
    return await _obtenerProfesionalesTurnosServiced().then((value) {
      return value.profesionales;
    }).onError((Exception error, stackTrace) {
      throw error;
    });
  }*/

  Future<ObtenerProfesionalesResponse> _obtenerProfesionalesService(
    int idEspecialidad,
    int idModalidadAtencion,
    int? idLocalidad,
  ) async {
    try {
      final resp = await http
          .get(Uri.parse(
              '${BaseEndpoints.obtenerProfesionales}?idespecialidad=$idEspecialidad&idmodalidad=$idModalidadAtencion&codpostal=$idLocalidad'))
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return ObtenerProfesionalesResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }

  /*Future<ObtenerProfesionalesResponse>
      _obtenerProfesionalesTurnosServiced() async {
    // Uri url = Uri.parse(
    // '${Environments.apiUrl}/profesionales?especialidad=${especialidad?.id}&&modalidadAtencion=${modalidadAtencion?.id}&&localidad=${localidad?.codigoPostal}');

    try {
      final resp =
          await http.get(Uri.parse('')).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return ObtenerProfesionalesResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }*/
}
