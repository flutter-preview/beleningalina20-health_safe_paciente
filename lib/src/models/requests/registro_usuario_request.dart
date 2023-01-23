import 'dart:io';

class RegistroUsuarioRequest {
  RegistroUsuarioRequest(
      {required this.correo,
      required this.contrasena,
      required this.dni,
      required this.nombre,
      required this.apellido,
      required this.imagenPerfil,
      required this.imagenDniFrente,
      required this.imagenDniDorso,
      required this.sexo,
      required this.fechaNacimiento});

  String correo;
  String contrasena;
  String dni;
  String nombre;
  String apellido;
  File imagenPerfil;
  File imagenDniFrente;
  File imagenDniDorso;
  String sexo;
  DateTime fechaNacimiento;

  Map<String, String> toJson() => {
        'correo': correo.trim(),
        'contrasena': contrasena.trim(),
        'nombre': nombre.trim(),
        'apellido': apellido.trim(),
        'dni': dni.trim(),
        'fechaNacimiento': fechaNacimiento.toString(),
        'sexo': sexo.trim().toUpperCase()[0],
        'idrol': '1'
      };

  @override
  String toString() =>
      '$correo - $contrasena - $dni - $nombre - $apellido - ${imagenPerfil.path} - ${imagenDniFrente.path} - ${imagenDniDorso.path} - $sexo - $fechaNacimiento';
}
