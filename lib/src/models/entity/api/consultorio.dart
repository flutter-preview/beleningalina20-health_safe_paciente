import 'package:health_safe_paciente/src/models/models.dart';

class Consultorio {
  Consultorio({required this.id, this.descripcion, required this.direccion});

  int id;
  String? descripcion;
  Direccion direccion;

  factory Consultorio.fromJson(Map<String, dynamic> json) => Consultorio(
      id: json["idconsultorio"],
      descripcion: json["descripcion"],
      direccion: Direccion.fromJson(json["direccion"]));
}
