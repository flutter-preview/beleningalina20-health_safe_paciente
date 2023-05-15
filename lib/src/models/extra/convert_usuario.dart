import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';
import 'package:health_safe_paciente/src/models/server/database/database_models.dart';

class ConvertUsuarioToUsuarioDto {
  static UsuarioDto convert(Usuario usuario) => UsuarioDto(
      id: usuario.id,
      correo: usuario.correo,
      nombre: usuario.nombre,
      apellido: usuario.apellido,
      sexo: usuario.sexo,
      imagenPerfil: usuario.imagenPerfil,
      rol: RolDto(
        id: usuario.rol.id,
        descripcion: usuario.rol.descripcion,
      ));
}

class ConvertUsuarioEntityToUsuarioDto {
  static UsuarioDto convert(UsuarioEntity usuario) => UsuarioDto(
      id: usuario.id,
      correo: usuario.correo,
      nombre: usuario.nombre,
      apellido: usuario.apellido,
      sexo: usuario.sexo,
      imagenPerfil: usuario.urlImagenPerfil,
      rol: RolDto(id: usuario.rol.id, descripcion: usuario.rol.descripcion));

  static UsuarioEntity revert(UsuarioDto usuario) => UsuarioEntity(
      id: usuario.id,
      correo: usuario.correo,
      nombre: usuario.nombre,
      apellido: usuario.apellido,
      urlImagenPerfil: usuario.imagenPerfil,
      sexo: usuario.sexo,
      rol: RolEntity(id: usuario.rol.id, descripcion: usuario.rol.descripcion));
}
