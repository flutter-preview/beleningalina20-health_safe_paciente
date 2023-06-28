import 'package:health_safe_paciente/src/services/api/models/models.dart';

class Paciente {
  Paciente({
    required this.id,
    required this.usuario,
    this.ocupacion,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  Usuario usuario;
  String? ocupacion;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
        id: json["idpaciente"],
        usuario: Usuario.fromJson(json["usuario"]),
        ocupacion: json["ocupacion"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
