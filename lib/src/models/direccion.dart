import 'package:health_safe_paciente/src/models/models.dart';

class Direccion {
  int id;
  String calle;
  String? barrio;
  String? manzana;
  int? piso;
  int numero;
  Localidad localidad;

  Direccion({
    required this.id,
    required this.calle,
    required this.numero,
    this.piso,
    required this.localidad,
  });

  factory Direccion.fromJson(Map<String, dynamic> json) => Direccion(
      id: json["iddireccion"],
      calle: json["calle"],
      piso: json["piso"],
      numero: json["numero"],
      localidad: Localidad.fromJson(json["localidad"]));

  String toLongString() =>
      "$calle $numero ${(piso != null) ? "$piso°" : ""}, ${localidad.descripcion}, Tucumán, Argentina";
  String toShortString() => "$calle $numero";
}
