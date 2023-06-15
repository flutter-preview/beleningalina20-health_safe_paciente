import 'dart:convert';

class LoginRequest {
  LoginRequest({required this.correo, required this.contrasena});

  String correo;
  String contrasena;

  String toJson() => jsonEncode({'correo': correo, 'contrasena': contrasena});
}
