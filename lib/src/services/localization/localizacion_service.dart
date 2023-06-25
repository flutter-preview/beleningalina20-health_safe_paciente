import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';

class LocalizacionService {
  final String _url =
      'https://us1.locationiq.com/v1/search?key=pk.4e5f1dc478e4bb16c8657ab26a7acfc5&format=json';

  Future<LatLng?> obtenerLatitudLongitud(DireccionDto direccion) async {
    final String encodedDireccion = Uri.encodeComponent(
        "${direccion.numero}, ${direccion.calle}, ${direccion.localidad.descripcion}, Tucuman, Argentina");

    try {
      final resp = await http
          .get(Uri.parse('$_url/&q=$encodedDireccion'))
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
