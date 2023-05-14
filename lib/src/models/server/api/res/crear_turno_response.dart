import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class CrearTurnoResponse {
  CrearTurnoResponse({required this.msg, required this.turno});

  String msg;
  Turno turno;

  factory CrearTurnoResponse.fromJson(Map<String, dynamic> json) =>
      CrearTurnoResponse(
          msg: json["msg"], turno: Turno.fromJson(json["turno"]));
}
