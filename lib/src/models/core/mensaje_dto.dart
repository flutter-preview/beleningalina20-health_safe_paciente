class MensajeDto {
  MensajeDto(
      {required this.id,
      required this.idEmisor,
      required this.texto,
      required this.fechaHora});

  int id;
  int idEmisor;
  String texto;
  DateTime fechaHora;
}
