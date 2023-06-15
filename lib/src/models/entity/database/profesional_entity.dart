import 'package:health_safe_paciente/src/models/models.dart';

class ProfesionalEntity {
  ProfesionalEntity({required this.id, required this.usuario});

  int id;
  UsuarioEntity usuario;

  factory ProfesionalEntity.fromJson(Map<String, dynamic> json) =>
      ProfesionalEntity(
          id: int.parse(json["id"].toString()),
          usuario: UsuarioEntity(
              id: int.parse(json["idUsuario"].toString()),
              correo: json["correo"].toString(),
              nombre: json["nombre"].toString(),
              apellido: json["apellido"].toString(),
              urlImagenPerfil: json["urlImagenPerfil"].toString(),
              sexo: json["sexo"].toString(),
              rol: RolEntity(
                  id: json["idRol"], descripcion: json["descripcion"])));

  Map<String, String> toJson() =>
      {'id': id.toString(), 'idUsuario': usuario.id.toString()};

  @override
  String toString() =>
      "${(usuario.sexo == "Masculino") ? "Dr." : "Dra."} ${usuario.nombre} ${usuario.apellido}";
}
