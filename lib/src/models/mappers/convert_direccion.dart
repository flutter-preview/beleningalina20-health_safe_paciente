import 'package:health_safe_paciente/src/database/models/local.dart' as local;
import 'package:health_safe_paciente/src/models/mappers/mappers.dart';
import 'package:health_safe_paciente/src/models/models.dart' as remote;

class ConvertDireccion {
  static local.Direccion convert(remote.Direccion direccion) => local.Direccion(
      id: direccion.id,
      calle: direccion.calle,
      localidad: ConvertLocalidad.convert(direccion.localidad),
      numero: direccion.numero,
      piso: direccion.piso);
}
