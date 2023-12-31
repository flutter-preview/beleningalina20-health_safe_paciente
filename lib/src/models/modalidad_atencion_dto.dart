import 'package:health_safe_paciente/src/services/api/models/models.dart';

class ModalidadAtencionDto {
  int id;
  String descripcion;

  ModalidadAtencionDto({required this.id, required this.descripcion});

  factory ModalidadAtencionDto.fromApi(ModalidadAtencion modalidadAtencion) =>
      ModalidadAtencionDto(
          id: modalidadAtencion.id, descripcion: modalidadAtencion.descripcion);

  @override
  String toString() => descripcion;
}
