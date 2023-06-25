import 'dart:convert';

class LoginRequest {
  LoginRequest({required this.correo, required this.contrasena});

  String correo;
  String contrasena;

  Map<String, String> toJson() => {'correo': correo, 'contrasena': contrasena};

  String request() => jsonEncode(toJson());
}
