import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_safe_paciente/src/global/environments.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class AutenticacionService with ChangeNotifier {
  late Usuario _usuario;

  bool _isLoading = false;

  final _storage = const FlutterSecureStorage();

  Usuario get usuario => _usuario;
  set usuario(Usuario value) {
    _usuario = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  static Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  }

  Future<bool> registroUsuario() async {
    // TODO

    return true;
  }

  Future<bool> login() async {
    // TODO

    return true;
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token');
    if (token == null) return false;

    final resp = await http.get(
        Uri.parse("${Environment.apiUrl}/autenticacion/login/renew"),
        headers: {'Content-Type': 'application/json', 'x-token': token});

    if (resp.statusCode != 200) {
      logout();
      return false;
    }

    final loginResponse = json.decode(resp.body);
    usuario = Usuario.fromJson(loginResponse['usuario']);
    _guardarToken(loginResponse['token']);
    return true;
  }

  Future _guardarToken(String token) async =>
      await _storage.write(key: 'token', value: token);

  Future logout() async => await _storage.delete(key: 'token');
}
