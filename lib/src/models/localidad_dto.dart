import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/database/models/models.dart';

class LocalidadDto {
  int codigoPostal;
  String descripcion;

  LocalidadDto({required this.codigoPostal, required this.descripcion});

  factory LocalidadDto.fromApi(Localidad localidad) => LocalidadDto(
      codigoPostal: localidad.codigoPostal, descripcion: localidad.descripcion);

  factory LocalidadDto.fromDatabase(Localidad localidad) => LocalidadDto(
      codigoPostal: localidad.codigoPostal, descripcion: localidad.descripcion);

  LocalidadEntity toEntity() => LocalidadEntity(
        codigoPostal: codigoPostal,
        descripcion: descripcion,
      );
}
