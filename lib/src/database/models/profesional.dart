import 'package:health_safe_paciente/src/database/models/local.dart';

class Profesional {
  Profesional({required this.id, this.descripcion, required this.usuario});

  int id;
  String? descripcion;
  Usuario usuario;

  factory Profesional.fromJson(Map<String, Object?> json) => Profesional(
      id: int.parse(json["id"].toString()),
      descripcion: json["descripcion"].toString(),
      usuario: Usuario(
          id: int.parse(json["idUsuario"].toString()),
          correo: json["correo"].toString(),
          nombre: json["nombre"].toString(),
          apellido: json["apellido"].toString(),
          urlImagenPerfil: json["urlImagenPerfil"].toString(),
          sexo: json["sexo"].toString()));

  Map<String, String> toJson() => {
        'id': id.toString(),
        'descripcion': descripcion ?? '',
        'idUsuario': usuario.id.toString()
      };

  @override
  String toString() =>
      "${(usuario.sexo == "Masculino") ? "Dr." : "Dra."} ${usuario.nombre} ${usuario.apellido}";
}
