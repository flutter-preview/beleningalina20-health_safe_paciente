import 'package:health_safe_paciente/src/models/core/core_models.dart';

class DireccionDto {
  DireccionDto(
      {required this.id,
      required this.calle,
      required this.numero,
      this.piso,
      required this.localidad});

  int id;
  String calle;
  int? piso;
  int numero;
  LocalidadDto localidad;

  @override
  String toString() => "$calle $numero";

  String toLongString() =>
      "$calle $numero ${(piso != null) ? "$piso°" : ""}, ${localidad.descripcion}, Tucumán, Argentina";
}
