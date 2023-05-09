import 'package:health_safe_paciente/src/database/models/local.dart' as local;
import 'package:health_safe_paciente/src/models/models.dart' as remote;

class ConvertModalidadAtencion {
  static local.ModalidadAtencion convert(
          remote.ModalidadAtencion modalidadAtencion) =>
      local.ModalidadAtencion(
          id: modalidadAtencion.id, descripcion: modalidadAtencion.descripcion);
}
