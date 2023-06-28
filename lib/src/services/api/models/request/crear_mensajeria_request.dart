import 'dart:convert';

class CrearMensajeriaRequest {
  int idPaciente;
  int idProfesional;

  CrearMensajeriaRequest(
      {required this.idPaciente, required this.idProfesional});

  Map<String, String> toJson() => {
        'idpaciente': idPaciente.toString(),
        'idprofesional': idProfesional.toString()
      };

  String request() => jsonEncode(toJson());
}
