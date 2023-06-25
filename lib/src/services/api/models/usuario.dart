import 'package:health_safe_paciente/src/services/api/models/models.dart';

class Usuario {
  Usuario({
    required this.id,
    required this.correo,
    required this.contrasena,
    required this.dni,
    required this.nombre,
    required this.apellido,
    required this.fechaNacimiento,
    required this.sexo,
    this.imagenPerfil,
    this.imagenDniFrente,
    this.imagenDniDorso,
    this.createdAt,
    this.updatedAt,
    required this.rol,
  });

  int id;
  String correo;
  String contrasena;
  int dni;
  String nombre;
  String apellido;
  DateTime fechaNacimiento;
  String sexo;
  String? imagenPerfil;
  String? imagenDniFrente;
  String? imagenDniDorso;
  DateTime? createdAt;
  DateTime? updatedAt;
  Rol rol;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["idusuario"],
        correo: json["correo"],
        contrasena: json["contrasena"],
        dni: json["dni"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        fechaNacimiento: DateTime.parse(json["fechanacimiento"]),
        sexo: json["sexo"],
        imagenPerfil: json["imgperfil"],
        imagenDniFrente: json["imgdnifrente"],
        imagenDniDorso: json["imgdnidorso"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        rol: Rol.fromJson(json["rol"]),
      );
}
