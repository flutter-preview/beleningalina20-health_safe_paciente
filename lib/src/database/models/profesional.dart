import 'package:health_safe_paciente/src/database/models/local.dart';

class Profesional {
  Profesional({required this.id, this.descripcion, required this.usuario});

  int id;
  String? descripcion;
  Usuario usuario;

  Map<String, String> toJson() => {
        'id': id.toString(),
        'descripcion': descripcion ?? '',
        'idUsuario': usuario.id.toString()
      };
}
