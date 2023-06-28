import 'package:health_safe_paciente/src/services/api/models/models.dart';

class ObtenerTurnosResponse {
  List<TurnoPaciente> turnos;

  ObtenerTurnosResponse({
    required this.turnos,
  });

  factory ObtenerTurnosResponse.fromJson(Map<String, dynamic> json) =>
      ObtenerTurnosResponse(
        turnos: List<TurnoPaciente>.from(
            json["turnos"].map((x) => TurnoPaciente.fromJson(x))),
      );
}
