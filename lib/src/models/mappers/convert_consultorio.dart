import 'package:health_safe_paciente/src/database/models/local.dart' as local;
import 'package:health_safe_paciente/src/models/mappers/mappers.dart';
import 'package:health_safe_paciente/src/models/models.dart' as remote;

class ConvertConsultorio {
  static local.Consultorio? convert(remote.Consultorio? consultorio) =>
      (consultorio != null)
          ? local.Consultorio(
              id: consultorio.id,
              direccion: ConvertDireccion.convert(consultorio.direccion),
              descripcion: consultorio.descripcion)
          : null;
}
