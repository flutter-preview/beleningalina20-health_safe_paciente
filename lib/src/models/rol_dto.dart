import 'package:health_safe_paciente/src/services/api/models/rol.dart';
import 'package:health_safe_paciente/src/services/database/models/rol_entity.dart';

class RolDto {
  int id;
  String descripcion;

  RolDto({required this.id, required this.descripcion});

  factory RolDto.fromApi(Rol rol) =>
      RolDto(id: rol.id, descripcion: rol.descripcion);

  factory RolDto.fromDatabase(RolEntity rol) =>
      RolDto(id: rol.id, descripcion: rol.descripcion);

  RolEntity toEntity() => RolEntity(
        id: id,
        descripcion: descripcion,
      );
}
