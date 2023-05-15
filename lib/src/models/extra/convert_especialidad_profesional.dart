import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/extra/convert_especialidad.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class ConvertEspecialidadProfesionalToEspecialidadProfesionalDto {
  static EspecialidadProfesionalDto convert(
          EspecialidadProfesional especialidadProfesional) =>
      EspecialidadProfesionalDto(
          especialidad: ConvertEspecialidadToEspecialidadDto.convert(
              especialidadProfesional.especialidad),
          anoOtorgamiento: especialidadProfesional.anoOtorgamiento);
}
