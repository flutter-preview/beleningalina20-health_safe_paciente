import 'package:health_safe_paciente/src/models/core/core_models.dart';

class EspecialidadProfesionalDto {
  EspecialidadProfesionalDto({
    required this.especialidad,
    required this.anoOtorgamiento,
  });

  EspecialidadDto especialidad;
  int anoOtorgamiento;
}
