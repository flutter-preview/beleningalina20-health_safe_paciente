import 'package:health_safe_paciente/src/models/core/core_models.dart';

class MatriculaProfesionalDto {
  MatriculaProfesionalDto({
    required this.id,
    required this.numeroMatricula,
    required this.tipoMatriculaProfesional,
    required this.universidad,
    required this.anoOtorgamiento,
  });

  int id;
  int numeroMatricula;
  TipoMatriculaProfesionalDto tipoMatriculaProfesional;
  UniversidadDto universidad;
  int anoOtorgamiento;
}
