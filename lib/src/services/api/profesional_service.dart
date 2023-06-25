import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/services/api/constants/environments.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';

class ProfesionalService {
  Future<List<ProfesionalDto>> obtenerProfesionales(
      ObtenerProfesionalesRequest params) async {
    try {
      final resp = await http
          .get(Uri.parse('${Environments.apiUrl}/profesionales?$params'))
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      List<Profesional> profesionales =
          ObtenerProfesionalesResponse.fromJson(response).profesionales;

      return List<ProfesionalDto>.from(profesionales
          .map((profesional) => ProfesionalDto.fromApi(profesional)));
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
