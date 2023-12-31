import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';

class UsuarioDto {
  int id;
  String correo;
  String? contrasena;
  String nombre;
  String apellido;
  int? dni;
  DateTime? fechaNacimiento;
  String sexo;
  String urlImagenPerfil;
  String urlImagenDniFrente;
  String urlImagenDniDorso;
  RolDto rol;

  UsuarioDto(
      {required this.id,
      required this.correo,
      this.contrasena,
      required this.nombre,
      required this.apellido,
      this.dni,
      this.fechaNacimiento,
      required this.sexo,
      required this.urlImagenPerfil,
      required this.urlImagenDniFrente,
      required this.urlImagenDniDorso,
      required this.rol});

  factory UsuarioDto.fromApi(Usuario usuario) => UsuarioDto(
      id: usuario.id,
      correo: usuario.correo,
      contrasena: usuario.contrasena,
      nombre: usuario.nombre,
      apellido: usuario.apellido,
      dni: usuario.dni,
      fechaNacimiento: usuario.fechaNacimiento,
      sexo: usuario.sexo,
      urlImagenPerfil: usuario.imagenPerfil,
      urlImagenDniFrente: usuario.imagenDniFrente,
      urlImagenDniDorso: usuario.imagenDniDorso,
      rol: RolDto.fromApi(usuario.rol));

  @override
  String toString() => "$nombre $apellido";
}
