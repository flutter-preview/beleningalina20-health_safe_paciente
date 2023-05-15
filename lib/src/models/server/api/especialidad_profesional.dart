import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class EspecialidadProfesional {
  EspecialidadProfesional({
    required this.especialidad,
    required this.anoOtorgamiento,
  });

  Especialidad especialidad;
  int anoOtorgamiento;

  factory EspecialidadProfesional.fromJson(Map<String, dynamic> json) =>
      EspecialidadProfesional(
        especialidad: Especialidad.fromJson(json["especialidad"]),
        anoOtorgamiento: json["aniootorgamiento"],
      );
}
