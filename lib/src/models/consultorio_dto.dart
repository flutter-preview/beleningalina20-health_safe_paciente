import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';

class ConsultorioDto {
  ConsultorioDto({required this.id, this.descripcion, required this.direccion});

  int id;
  String? descripcion;
  DireccionDto direccion;

  factory ConsultorioDto.fromApi(Consultorio consultorio) => ConsultorioDto(
      id: consultorio.id,
      descripcion: consultorio.descripcion,
      direccion: DireccionDto.fromApi(consultorio.direccion));
}
