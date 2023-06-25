import 'package:health_safe_paciente/src/services/api/models/models.dart';

class CrearTurnoResponse {
  CrearTurnoResponse({required this.msg, required this.turno});

  String msg;
  Turno turno;

  factory CrearTurnoResponse.fromJson(Map<String, dynamic> json) =>
      CrearTurnoResponse(
          msg: json["msg"], turno: Turno.fromJson(json["turno"]));
}
