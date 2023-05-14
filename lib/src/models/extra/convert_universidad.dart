import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class ConvertUniversidadToUniversidadDto {
  static UniversidadDto convert(Universidad universidad) =>
      UniversidadDto(id: universidad.id, descripcion: universidad.descripcion);
}
