import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/extra/mappers.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class ConvertConsultorioToConsultorioDto {
  static ConsultorioDto convert(Consultorio consultorio) => ConsultorioDto(
      id: consultorio.id,
      descripcion: consultorio.descripcion,
      direccion: ConvertDireccionToDireccionDto.convert(consultorio.direccion));
}
