import 'package:health_safe_paciente/src/models/models.dart';

class ObtenerAgendasTurnosResponse {
  ObtenerAgendasTurnosResponse({
    required this.agendasTurnos,
  });

  List<AgendaTurnos> agendasTurnos;

  factory ObtenerAgendasTurnosResponse.fromJson(Map<String, dynamic> json) =>
      ObtenerAgendasTurnosResponse(
        agendasTurnos: List<AgendaTurnos>.from(
            json["agendas"].map((x) => AgendaTurnos.fromJson(x))),
      );
}
