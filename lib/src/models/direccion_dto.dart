import 'package:health_safe_paciente/src/models/localidad_dto.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/database/models/models.dart';

class DireccionDto {
  int id;
  String calle;
  int? piso;
  int numero;
  LocalidadDto localidad;

  DireccionDto({
    required this.id,
    required this.calle,
    required this.numero,
    this.piso,
    required this.localidad,
  });

  factory DireccionDto.fromApi(Direccion direccion) => DireccionDto(
      id: direccion.id,
      calle: direccion.calle,
      piso: direccion.piso,
      numero: direccion.numero,
      localidad: LocalidadDto.fromApi(direccion.localidad));

  DireccionEntity toEntity() => DireccionEntity(
      id: id,
      calle: calle,
      numero: numero,
      piso: piso,
      localidad: localidad.toEntity());
  @override
  String toString() => "$calle $numero";
}
