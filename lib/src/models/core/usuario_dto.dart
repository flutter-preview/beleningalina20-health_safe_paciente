import 'package:health_safe_paciente/src/models/core/core_models.dart';

class UsuarioDto {
  UsuarioDto({
    required this.id,
    required this.correo,
    required this.nombre,
    required this.apellido,
    required this.sexo,
    required this.imagenPerfil,
    required this.rol,
  });

  int id;
  String correo;
  String nombre;
  String apellido;
  String sexo;
  String imagenPerfil;
  RolDto rol;
}
