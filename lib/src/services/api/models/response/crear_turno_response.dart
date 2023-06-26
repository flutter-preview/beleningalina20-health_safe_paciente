import 'package:health_safe_paciente/src/services/api/models/models.dart';

class CrearTurnoResponse {
  CrearTurnoResponse({required this.msg, required this.turno});

  String msg;
  TurnoPaciente turno;

  factory CrearTurnoResponse.fromJson(Map<String, dynamic> json) =>
      CrearTurnoResponse(
          msg: json["msg"], turno: TurnoPaciente.fromJson(json["turno"]));
}
