import 'package:health_safe_paciente/src/services/api/models/models.dart';

class ObtenerMensajesResponse {
  ObtenerMensajesResponse({
    required this.mensajes,
  });

  List<Mensaje> mensajes;

  factory ObtenerMensajesResponse.fromJson(Map<String, dynamic> json) =>
      ObtenerMensajesResponse(
        mensajes: List<Mensaje>.from(
            json["mensajes"].map((x) => Mensaje.fromJson(x))),
      );
}
