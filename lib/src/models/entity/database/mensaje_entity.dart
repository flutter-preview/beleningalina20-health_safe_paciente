class MensajeEntity {
  MensajeEntity({
    required this.id,
    required this.idEmisor,
    required this.mensaje,
    required this.fechaHora,
  });

  int id;
  int idEmisor;
  String mensaje;
  DateTime fechaHora;

  factory MensajeEntity.fromJson(Map<String, dynamic> json) => MensajeEntity(
      id: json["id"],
      idEmisor: json["idEmisor"],
      mensaje: json["mensaje"],
      fechaHora: json["fechaHora"]);
}
