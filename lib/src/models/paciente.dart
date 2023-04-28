import 'package:health_safe_paciente/src/models/historia_clinica.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class Paciente {
  Paciente({
    required this.id,
    required this.usuario,
    this.ocupacion = const [],
    required this.historiaClinica,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  Usuario usuario;
  List<String> ocupacion;
  HistoriaClinica historiaClinica;
  DateTime createdAt;
  DateTime updatedAt;

  factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
        id: json["idpaciente"],
        usuario: Usuario.fromJson(json["idusuario"]),
        ocupacion: json["ocupacion"],
        historiaClinica: HistoriaClinica.fromJson(json["idhistoriaclinica"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
