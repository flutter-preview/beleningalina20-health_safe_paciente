import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/services/localization/constants/localization_endpoint.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';

class LocalizacionService {
  Future<LatLng?> obtenerLatitudLongitud(DireccionDto direccion) async {
    return await obtenerLatitudLongitudService(direccion).then((value) {
      return value;
    }).onError((Exception error, stackTrace) {
      throw error;
    });
  }

  Future<LatLng?> obtenerLatitudLongitudService(DireccionDto direccion) async {
    final String encodedDireccion = Uri.encodeComponent(
        "${direccion.numero}, ${direccion.calle}, ${direccion.localidad.descripcion}, Tucuman, Argentina");

    try {
      final resp = await http
          .get(Uri.parse(
              '${LocalizationEndpoints.obtenerLatLng}/&q=$encodedDireccion'))
          .timeout(const Duration(seconds: 5));

      debugPrint(resp.body.toString());

      var response = jsonDecode(resp.body);

      final double? latitud = double.tryParse(response[0]["lat"]);
      final double? longitud = double.tryParse(response[0]["lon"]);

      return (latitud != null && longitud != null)
          ? LatLng(latitud, longitud)
          : null;
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
