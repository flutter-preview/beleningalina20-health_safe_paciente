import 'package:health_safe_paciente/src/database/models/local.dart' as local;
import 'package:health_safe_paciente/src/models/models.dart' as remote;

class ConvertLocalidad {
  static local.Localidad convert(remote.Localidad localidad) => local.Localidad(
      codigoPostal: localidad.codigoPostal, descripcion: localidad.descripcion);
}
