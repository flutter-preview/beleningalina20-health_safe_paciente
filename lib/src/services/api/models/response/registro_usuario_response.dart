import 'package:health_safe_paciente/src/services/api/models/models.dart';

class RegistroUsuarioResponse {
  RegistroUsuarioResponse({
    this.msg,
    required this.usuario,
  });

  String? msg;
  Usuario usuario;

  factory RegistroUsuarioResponse.fromJson(Map<String, dynamic> json) =>
      RegistroUsuarioResponse(
        msg: json["msg"],
        usuario: Usuario.fromJson(json["usuario"]),
      );
}
