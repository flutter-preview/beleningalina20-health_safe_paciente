import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

class Usuario {
  Usuario({
    required this.idusuario,
    required this.correo,
    required this.contrasena,
    required this.dni,
    required this.nombre,
    required this.apellido,
    required this.fechanacimiento,
    required this.sexo,
    required this.imgperfil,
    required this.imgdnifrente,
    required this.imgdnidorso,
    this.createdAt,
    this.updatedAt,
    required this.rol,
  });

  int idusuario;
  String correo;
  String contrasena;
  int dni;
  String nombre;
  String apellido;
  DateTime fechanacimiento;
  String sexo;
  String imgperfil;
  String imgdnifrente;
  String imgdnidorso;
  DateTime? createdAt;
  DateTime? updatedAt;
  Rol rol;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idusuario: json["idusuario"],
        correo: json["correo"],
        contrasena: json["contrasena"],
        dni: json["dni"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        fechanacimiento: DateTime.parse(json["fechanacimiento"]),
        sexo: json["sexo"],
        imgperfil: json["imgperfil"],
        imgdnifrente: json["imgdnifrente"],
        imgdnidorso: json["imgdnidorso"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        rol: Rol.fromJson(json["rol"]),
      );
}

class Rol {
  Rol({
    required this.idrol,
    required this.descripcion,
    this.createdAt,
    this.updatedAt,
  });

  int idrol;
  String descripcion;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Rol.fromJson(Map<String, dynamic> json) => Rol(
        idrol: json["idrol"],
        descripcion: json["descripcion"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
