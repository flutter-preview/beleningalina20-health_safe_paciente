import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/extra/convert_tipo_matricula_profesional.dart';
import 'package:health_safe_paciente/src/models/extra/convert_universidad.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class ConvertMatriculaProfesionalToMatriculaProfesionalDto {
  static MatriculaProfesionalDto convert(
          MatriculaProfesional matriculaProfesional) =>
      MatriculaProfesionalDto(
        anoOtorgamiento: matriculaProfesional.anoOtorgamiento,
        id: matriculaProfesional.id,
        numeroMatricula: matriculaProfesional.numeroMatricula,
        tipoMatriculaProfesional:
            ConvertTipoMatriculaProfesionalToTipoMatriculaProfesionalDto
                .convert(matriculaProfesional.tipoMatriculaProfesional),
        universidad: ConvertUniversidadToUniversidadDto.convert(
            matriculaProfesional.universidad),
      );
}
