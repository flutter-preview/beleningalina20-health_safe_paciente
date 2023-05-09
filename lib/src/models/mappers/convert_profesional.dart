import 'package:health_safe_paciente/src/database/models/local.dart' as local;
import 'package:health_safe_paciente/src/models/mappers/mappers.dart';
import 'package:health_safe_paciente/src/models/models.dart' as remote;

class ConvertProfesional {
  static local.Profesional convert(remote.Profesional profesional) =>
      local.Profesional(
          id: profesional.id,
          usuario: ConvertUsuario.convert(profesional.usuario),
          descripcion: profesional.descripcion);
}
