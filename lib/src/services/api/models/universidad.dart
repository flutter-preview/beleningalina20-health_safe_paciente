import 'package:health_safe_paciente/src/services/api/models/models.dart';

class Universidad {
  Universidad(
      {required this.id,
      required this.nombre,
      required this.pais,
      this.createdAt,
      this.updatedAt});

  int id;
  String nombre;
  Pais pais;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Universidad.fromJson(Map<String, dynamic> json) => Universidad(
        id: json["iduniversidad"],
        nombre: json["nombre"],
        pais: Pais.fromJson(json['pais']),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
