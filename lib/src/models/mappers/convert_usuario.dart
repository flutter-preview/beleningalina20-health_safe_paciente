import 'package:health_safe_paciente/src/database/models/local.dart' as local;
import 'package:health_safe_paciente/src/models/models.dart' as remote;

class ConvertUsuario {
  static local.Usuario convert(remote.Usuario usuario) => local.Usuario(
      id: usuario.id,
      apellido: usuario.apellido,
      correo: usuario.correo,
      nombre: usuario.nombre,
      sexo: usuario.sexo,
      urlImagenPerfil: usuario.imagenPerfil);
}
