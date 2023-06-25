import 'dart:convert';

class RegistroPacienteRequest {
  int idUsuario;
  String ocupacion;

  RegistroPacienteRequest({required this.idUsuario, required this.ocupacion});

  Map<String, String> toJson() =>
      {'idusuario': idUsuario.toString(), 'ocupacion': ocupacion};

  String request() => jsonEncode(toJson());
}
