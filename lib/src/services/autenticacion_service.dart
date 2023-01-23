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

  Future<bool> registroUsuario(
      RegistroUsuarioRequest registroUsuarioRequest) async {
    isLoading = true;
    Uri url = Uri.parse('${Environment.apiUrl}/usuarios/');

    var request = http.MultipartRequest("post", url);
    request.headers.addAll({'Content-Type': 'application/json'});

    request.fields.addAll(registroUsuarioRequest.toJson());

    request.files.addAll([
      http.MultipartFile.fromString(
          'imagenPerfil', registroUsuarioRequest.imagenPerfil.path),
      http.MultipartFile.fromString(
          'imagenDniFrente', registroUsuarioRequest.imagenDniFrente.path),
      http.MultipartFile.fromString(
          'imagenDniDorso', registroUsuarioRequest.imagenDniDorso.path),
    ]);

    var response = await request.send();
    var resp = await http.Response.fromStream(response);

    // body -> Connection refused

    if (resp.statusCode != 201) return false;

    final autenticacionUsuarioResponse =
        autenticacionResponseFromJson(resp.body);
    usuario = autenticacionUsuarioResponse.usuario;
    await _guardarToken(autenticacionUsuarioResponse.token);

    isLoading = false;

    return true;
  }

  Future<bool> login(LoginRequest loginRequest) async {
    isLoading = true;

    var url = Uri.parse('${Environment.apiUrl}/api/auth/login');

    final resp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: loginRequest.toJson());

    if (resp.statusCode != 201) return false;
    final loginUsuarioResponse = autenticacionResponseFromJson(resp.body);
    usuario = loginUsuarioResponse.usuario;
    await _guardarToken(loginUsuarioResponse.token);

    isLoading = false;

    return true;
  }

  Future _guardarToken(String token) async =>
      await _storage.write(key: 'token', value: token);

  Future logout() async => await _storage.delete(key: 'token');
}
