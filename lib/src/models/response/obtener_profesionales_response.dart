import 'package:health_safe_paciente/src/models/models.dart';

class ObtenerProfesionalesResponse {
  ObtenerProfesionalesResponse({
    required this.profesionales,
  });

  List<Profesional> profesionales;

  factory ObtenerProfesionalesResponse.fromJson(Map<String, dynamic> json) =>
      ObtenerProfesionalesResponse(
        profesionales: List<Profesional>.from(
            json["profesionales"].map((x) => Profesional.fromJson(x))),
      );
}
