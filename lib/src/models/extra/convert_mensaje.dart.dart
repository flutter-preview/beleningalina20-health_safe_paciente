import 'package:health_safe_paciente/src/models/server/api/mensaje.dart';
import 'package:health_safe_paciente/src/models/core/mensaje_dto.dart';
import 'package:health_safe_paciente/src/models/server/database/mensaje_entity.dart';

class ConvertMensajeEntityToMensajeDto {
  static MensajeDto convert(MensajeEntity mensaje) => MensajeDto(
      id: mensaje.id,
      idEmisor: mensaje.idEmisor,
      texto: mensaje.mensaje,
      fechaHora: mensaje.fechaHora);

  static MensajeEntity revert(MensajeDto mensaje) => MensajeEntity(
      id: mensaje.id,
      idEmisor: mensaje.idEmisor,
      mensaje: mensaje.texto,
      fechaHora: mensaje.fechaHora);
}

class ConvertMensajeToMensajeDto {
  static MensajeDto convert(Mensaje mensaje) => MensajeDto(
      id: mensaje.id,
      idEmisor: mensaje.idEmisor,
      texto: mensaje.texto,
      fechaHora: mensaje.fechaHora);
}
