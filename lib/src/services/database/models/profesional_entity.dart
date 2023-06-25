import 'package:health_safe_paciente/src/services/database/models/models.dart';

class ProfesionalEntity {
  ProfesionalEntity(
      {required this.id, required this.usuario, required this.especialidades});

  int id;
  UsuarioEntity usuario;
  List<EspecialidadEntity> especialidades;

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
                  id: json["idRol"], descripcion: json["descripcion"])),
          especialidades: [] // TODO
          );

  Map<String, String> toJson() =>
      {'id': id.toString(), 'idUsuario': usuario.id.toString()};
}
