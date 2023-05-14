import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class ConvertLocalidadToLocalidadDto {
  static LocalidadDto convert(Localidad localidad) => LocalidadDto(
      codigoPostal: localidad.codigoPostal, descripcion: localidad.descripcion);
}
