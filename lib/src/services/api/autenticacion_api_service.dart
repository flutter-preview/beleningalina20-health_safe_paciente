import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/extra/mappers.dart';
import 'package:health_safe_paciente/src/services/api/constants/base_endpoints.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_utils.dart';
import 'package:health_safe_paciente/src/helpers/utils/local_storage_manager.dart';

class AutenticacionApiService extends ChangeNotifier {
  PacienteDto? _paciente;
  PacienteDto? get paciente => _paciente;
  set paciente(PacienteDto? value) {
    _paciente = value;
    notifyListeners();
  }

  Future login(String correo, String contrasena) async {
    final request = LoginRequest(correo: correo, contrasena: contrasena);

    await loginService(request).then((value) {
      paciente = ConvertPacienteToPacienteDto.convert(value.paciente);
      LocalStorage.localStorage.setToken(value.token);
    }).onError((Exception error, _) {
      throw error;
    });
  }

  Future<bool> isLoggedIn() async {
    final token = await LocalStorage.localStorage.getToken();
    if (token == null) return false;

    return await isLoggedInService(token).then((value) {
      paciente = ConvertPacienteToPacienteDto.convert(value.paciente);
      LocalStorage.localStorage.setToken(value.token);
      return true;
    }).onError((Exception error, _) {
      logout();
      return false;
    });
  }

  void logout() async {
    await LocalStorage.localStorage.deleteToken();
    paciente = null;
  }

  Future<LoginResponse> loginService(LoginRequest request) async {
    try {
      final resp = await http
          .post(Uri.parse(BaseEndpoints.login), body: request.toJson())
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return LoginResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponse> isLoggedInService(String token) async {
    try {
      final resp = await http.post(Uri.parse(BaseEndpoints.renew), headers: {
        'Content-Type': 'application/json',
        'x-token': token
      }).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return LoginResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
