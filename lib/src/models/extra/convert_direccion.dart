import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/extra/convert_localidad.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class ConvertDireccionToDireccionDto {
  static DireccionDto convert(Direccion direccion) => DireccionDto(
      id: direccion.id,
      calle: direccion.calle,
      localidad: ConvertLocalidadToLocalidadDto.convert(direccion.localidad),
      numero: direccion.numero,
      piso: direccion.piso);
}
