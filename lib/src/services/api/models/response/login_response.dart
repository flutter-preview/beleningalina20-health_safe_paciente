import 'package:health_safe_paciente/src/services/api/models/models.dart';

class LoginResponse {
  LoginResponse({
    required this.token,
    required this.paciente,
  });

  String token;
  Paciente paciente;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        paciente: Paciente.fromJson(json["paciente"]),
      );
}
