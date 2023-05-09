import 'package:health_safe_paciente/src/database/models/local.dart' as local;
import 'package:health_safe_paciente/src/models/models.dart' as remote;

class ConvertEspecialidad {
  static local.Especialidad convert(remote.Especialidad especialidad) =>
      local.Especialidad(
          id: especialidad.id, descripcion: especialidad.descripcion);
}
