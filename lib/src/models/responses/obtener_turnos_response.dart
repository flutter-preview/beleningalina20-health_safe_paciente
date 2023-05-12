import 'package:health_safe_paciente/src/models/models.dart';

class ObtenerTurnosResponse {
  List<Turno> turnos;

  ObtenerTurnosResponse({
    required this.turnos,
  });

  factory ObtenerTurnosResponse.fromJson(Map<String, dynamic> json) =>
      ObtenerTurnosResponse(
        turnos: List<Turno>.from(json["turnos"].map((x) => Turno.fromJson(x))),
      );
}