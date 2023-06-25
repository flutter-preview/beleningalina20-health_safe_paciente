import 'package:health_safe_paciente/src/services/api/models/models.dart';

class ObtenerModalidadesAtencionResponse {
  String? msg;
  List<ModalidadAtencion> modalidadesAtencion;

  ObtenerModalidadesAtencionResponse(
      {this.msg, required this.modalidadesAtencion});

  factory ObtenerModalidadesAtencionResponse.fromJson(
          Map<String, dynamic> json) =>
      ObtenerModalidadesAtencionResponse(
          msg: json["msg"],
          modalidadesAtencion: List<ModalidadAtencion>.from(
              json["modalidades"].map((x) => ModalidadAtencion.fromJson(x))));
}
