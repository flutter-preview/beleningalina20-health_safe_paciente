import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/mocks/login_response_mock.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/services/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/services/utils/environments.dart';
import 'package:health_safe_paciente/src/services/utils/local_storage_manager.dart';

class AutenticacionService extends ChangeNotifier {
  Usuario? _usuario;
  bool _isLoading = false;

  Usuario? get usuario => _usuario;
  set usuario(Usuario? value) {
    _usuario = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future login(String correo, String contrasena) async {
    isLoading = true;

    await loginService(correo, contrasena).then((value) {
      isLoading = false;
      usuario = usuario;
      LocalStorage.localStorage.setToken(value.token);
    }).onError((Exception error, stackTrace) {
      isLoading = false;
      throw error;
    });
  }

  void logout() async {
    await LocalStorage.localStorage.deleteToken();
    usuario = null;
  }

  Future<LoginResponse> loginService(String correo, String contrasena) async {
    late Map<String, dynamic> response;
    Uri url = Uri.parse('${Environments.apiUrl}/autenticacion/login');

    try {
      return loginResponseMock;
      final resp = await http.post(url, body: {
        'correo': correo,
        'contrasena': contrasena
      }).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return LoginResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
