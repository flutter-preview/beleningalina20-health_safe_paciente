import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/utils/api_utils.dart';
import 'package:health_safe_paciente/src/helpers/utils/local_storage_manager.dart';

class AutenticacionService extends ChangeNotifier {
  Usuario? usuario;

  Future login(String correo, String contrasena) async {
    final request = LoginRequest(correo: correo, contrasena: contrasena);

    await loginService(request).then((value) {
      usuario = value.usuario;
      LocalStorage.localStorage.setToken(value.token);
    }).onError((Exception error, _) {
      throw error;
    });
  }

  void logout() async {
    await LocalStorage.localStorage.deleteToken();
    usuario = null;
  }

  Future<LoginResponse> loginService(LoginRequest request) async {
    print(request.correo);
    print(request.contrasena);
    try {
      final resp = await http.post(
          Uri.parse('${Environments.apiUrl}/auth/login'),
          body: request.toJson(),
          headers: {'Content-Type': 'application/json'});

      debugPrint("resp: ${resp.body.toString()}");

      Map<String, dynamic> response = apiResponseMapper(resp);

      return LoginResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
