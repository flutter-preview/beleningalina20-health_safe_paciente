import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/database/models/models.dart';

class EspecialidadDto {
  int id;
  String descripcion;

  EspecialidadDto({required this.id, required this.descripcion});

  factory EspecialidadDto.fromApi(Especialidad especialidad) => EspecialidadDto(
      id: especialidad.id, descripcion: especialidad.descripcion);

  factory EspecialidadDto.fromDatabase(EspecialidadEntity especialidad) =>
      EspecialidadDto(
          id: especialidad.id, descripcion: especialidad.descripcion);

  EspecialidadEntity toEntity() => EspecialidadEntity(
        id: id,
        descripcion: descripcion,
      );
}
