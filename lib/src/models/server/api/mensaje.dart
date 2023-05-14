class Mensaje {
  Mensaje(
      {required this.id,
      required this.idEmisor,
      required this.texto,
      required this.fechaHora});

  int id;
  int idEmisor;
  String texto;
  DateTime fechaHora;

  factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
      id: json['idUsuario'],
      idEmisor: json['idEmisor'],
      texto: json['texto'],
      fechaHora: DateTime.parse(json['fechaHora']));
}
