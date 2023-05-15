import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class ConvertTipoMatriculaProfesionalToTipoMatriculaProfesionalDto {
  static TipoMatriculaProfesionalDto convert(
          TipoMatriculaProfesional tipoMatriculaProfesional) =>
      TipoMatriculaProfesionalDto(
          id: tipoMatriculaProfesional.id,
          descripcion: tipoMatriculaProfesional.descripcion);
}
