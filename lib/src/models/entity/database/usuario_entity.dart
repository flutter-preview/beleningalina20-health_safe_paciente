import 'package:health_safe_paciente/src/models/models.dart';

class UsuarioEntity {
  UsuarioEntity(
      {required this.id,
      required this.correo,
      required this.nombre,
      required this.apellido,
      required this.urlImagenPerfil,
      required this.sexo,
      required this.rol});

  int id;
  String correo;
  String nombre;
  String apellido;
  String urlImagenPerfil;
  String sexo;
  RolEntity rol;

  Map<String, String> toJson() => {
        'id': id.toString(),
        'correo': correo,
        'nombre': nombre,
        'apellido': apellido,
        'urlImagenPerfil': urlImagenPerfil,
        'sexo': sexo,
        'idRol': rol.id.toString()
      };
}
