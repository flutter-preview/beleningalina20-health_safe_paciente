import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/api/constants/environments.dart';

class MensajeriaService {
  Future crearMensajeria(CrearMensajeriaRequest params) async {
    try {
      final resp = await http.post(
          Uri.parse('${Environments.apiUrl}/mensajeria'),
          body: params.request(),
          headers: {'Content-Type': 'application/json'});

      debugPrint(resp.body);

      apiResponseMapper(resp);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
