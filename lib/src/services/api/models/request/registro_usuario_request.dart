import 'dart:io';

class RegistroUsuarioRequest {
  String correo;
  String contrasena;
  String dni;
  String nombre;
  String apellido;
  DateTime fechaNacimiento;
  String sexo;
  File imagenPerfil;
  File imagenDniFrente;
  File imagenDniDorso;
  int idRol = 2;
  String ocupacion = '';

  RegistroUsuarioRequest({
    required this.correo,
    required this.contrasena,
    required this.dni,
    required this.nombre,
    required this.apellido,
    required this.fechaNacimiento,
    required this.sexo,
    required this.imagenPerfil,
    required this.imagenDniFrente,
    required this.imagenDniDorso,
    required this.ocupacion,
  });

  Map<String, String> toJson() => {
        "correo": correo,
        "contrasena": contrasena,
        "dni": dni,
        "nombre": nombre,
        "apellido": apellido,
        "idrol": idRol.toString(),
        "fechanacimiento": fechaNacimiento.toString(),
        "sexo": sexo[0]
      };
}
