class Mensaje {
  Mensaje(
      {required this.idUsuario, required this.texto, required this.fechaHora});

  int idUsuario;
  String texto;
  DateTime fechaHora;

  factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
      idUsuario: json['idUsuario'],
      texto: json['texto'],
      fechaHora: DateTime.parse(json['fechaHora']));
}
