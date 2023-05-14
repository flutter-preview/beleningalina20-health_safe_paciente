import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/extra/mappers.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';
import 'package:health_safe_paciente/src/models/server/database/database_models.dart';

class ConvertProfesionalToProfesionalDto {
  static ProfesionalDto convert(Profesional profesional) => ProfesionalDto(
      id: profesional.id,
      usuario: ConvertUsuarioToUsuarioDto.convert(profesional.usuario),
      especialidades: profesional.especialidades
          .map((especialidad) =>
              ConvertEspecialidadProfesionalToEspecialidadProfesionalDto
                  .convert(especialidad))
          .toList(),
      matriculasProfesionales: profesional.matriculasProfesionales
          .map((matriculaProfesional) =>
              ConvertMatriculaProfesionalToMatriculaProfesionalDto.convert(
                  matriculaProfesional))
          .toList());
}

class ConvertProfesionalDtoToProfesionalEntity {
  static ProfesionalEntity convert(ProfesionalDto profesional) =>
      ProfesionalEntity(
          id: profesional.id,
          usuario:
              ConvertUsuarioEntityToUsuarioDto.revert(profesional.usuario));

  static ProfesionalDto revert(ProfesionalEntity profesional) => ProfesionalDto(
      id: profesional.id,
      usuario: ConvertUsuarioEntityToUsuarioDto.convert(profesional.usuario),
      especialidades: [],
      matriculasProfesionales: []);
}
