import 'package:health_safe_paciente/src/services/api/models/models.dart';

class RegistroPacienteResponse {
  String token;
  Paciente paciente;

  RegistroPacienteResponse({required this.token, required this.paciente});

  factory RegistroPacienteResponse.fromJson(Map<String, dynamic> json) =>
      RegistroPacienteResponse(
          token: json['token'], paciente: Paciente.fromJson(json['paciente']));
}
