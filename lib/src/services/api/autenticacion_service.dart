import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/services/api/constants/environments.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/helpers/local_storage_manager.dart';

class AutenticacionService extends ChangeNotifier {
  UsuarioDto? _usuario;
  UsuarioDto? get usuario => _usuario;
  set usuario(UsuarioDto? value) {
    _usuario = value;
    notifyListeners();
  }

  Future login(LoginRequest params) async {
    try {
      final resp = await http.post(
          Uri.parse('${Environments.apiUrl}/auth/login'),
          body: params.request(),
          headers: {'Content-Type': 'application/json'});

      debugPrint("resp: ${resp.body.toString()}");

      Map<String, dynamic> response = apiResponseMapper(resp);

      LoginResponse loginResponse = LoginResponse.fromJson(response);

      usuario = UsuarioDto.fromApi(loginResponse.usuario);
      LocalStorage.localStorage.setToken(loginResponse.token);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }

  void logout() async {
    await LocalStorage.localStorage.deleteToken();
    usuario = null;
  }
}
