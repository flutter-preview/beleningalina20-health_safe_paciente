import 'package:health_safe_paciente/src/models/core/direccion_dto.dart';

class ConsultorioDto {
  ConsultorioDto({
    required this.id,
    required this.direccion,
    this.descripcion,
  });

  int id;
  DireccionDto direccion;
  String? descripcion;
}
