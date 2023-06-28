import 'package:health_safe_paciente/src/services/api/models/rol.dart';

class RolDto {
  int id;
  String descripcion;

  RolDto({required this.id, required this.descripcion});

  factory RolDto.fromApi(Rol rol) =>
      RolDto(id: rol.id, descripcion: rol.descripcion);
}
