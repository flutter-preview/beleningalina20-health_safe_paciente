import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/extra/convert_mensaje.dart.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_utils.dart';
import 'package:health_safe_paciente/src/helpers/utils/local_storage_manager.dart';
import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';
import 'package:health_safe_paciente/src/services/api/constants/base_endpoints.dart';

class ChatApiService {
  Future<List<MensajeDto>> obtenerMensajes(
      int idProfesional, int idPaciente, int desde) async {
    return await _obtenerMensajesService(idProfesional, idPaciente, desde)
        .then((value) {
      List<MensajeDto> mensajes = value.mensajes
          .map((mensaje) => ConvertMensajeToMensajeDto.convert(mensaje))
          .toList();
      return mensajes;
    }).onError((Exception error, stackTrace) => throw error);
  }

  Future<ObtenerMensajesResponse> _obtenerMensajesService(
      int idProfesional, int idPaciente, int desde) async {
    try {
      final resp = await http.get(
          Uri.parse(
              '${BaseEndpoints.obtenerMensajes}/$idProfesional$idPaciente'),
          headers: {
            'Content-Type': 'application/json',
            'x-token': await LocalStorage.localStorage.getToken() ?? ''
          });

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return ObtenerMensajesResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
