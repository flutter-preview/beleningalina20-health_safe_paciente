import 'package:health_safe_paciente/src/services/api/models/models.dart';

class EspecialidadProfesional {
  EspecialidadProfesional({
    required this.especialidad,
    required this.anoOtorgamiento,
  });

  Especialidad especialidad;
  int anoOtorgamiento;

  factory EspecialidadProfesional.fromJson(Map<String, dynamic> json) =>
      EspecialidadProfesional(
        especialidad: Especialidad(
            id: json['idespecialidad'], descripcion: json['descripcion']),
        anoOtorgamiento: json["Profesionales_Especialidades"]
            ["aniootorgamiento"],
      );
}
