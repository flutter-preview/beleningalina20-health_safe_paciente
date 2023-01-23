import 'dart:convert';
import 'package:health_safe_paciente/src/models/models.dart';

AutenticacionResponse autenticacionResponseFromJson(String str) =>
    AutenticacionResponse.fromJson(json.decode(str));

class AutenticacionResponse {
  AutenticacionResponse({
    required this.msg,
    required this.token,
    required this.usuario,
  });

  String msg;
  String token;
  Usuario usuario;

  factory AutenticacionResponse.fromJson(Map<String, dynamic> json) =>
      AutenticacionResponse(
        msg: json["msg"],
        token: json["token"],
        usuario: Usuario.fromJson(json["usuario"]),
      );
}
