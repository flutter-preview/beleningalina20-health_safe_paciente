import 'package:health_safe_paciente/src/services/api/models/models.dart';

class LocalidadDto {
  String codigoPostal;
  String descripcion;

  LocalidadDto({required this.codigoPostal, required this.descripcion});

  factory LocalidadDto.fromApi(Localidad localidad) => LocalidadDto(
      codigoPostal: localidad.codigoPostal, descripcion: localidad.descripcion);

  @override
  String toString() => descripcion;
}
