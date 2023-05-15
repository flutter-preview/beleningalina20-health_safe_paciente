import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';
import 'package:health_safe_paciente/src/models/server/database/especialidad_entity.dart';

class ConvertEspecialidadToEspecialidadDto {
  static EspecialidadDto convert(Especialidad especialidad) => EspecialidadDto(
      id: especialidad.id, descripcion: especialidad.descripcion);
}

class ConvertEspecialidadDtoToEspecialidadEntity {
  static EspecialidadEntity convert(EspecialidadDto especialidad) =>
      EspecialidadEntity(
          id: especialidad.id, descripcion: especialidad.descripcion);
}
