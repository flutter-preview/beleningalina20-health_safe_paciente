import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';
import 'package:health_safe_paciente/src/models/server/database/modalidad_atencion_entity.dart';

class ConvertModalidadAtencionToModalidadAtencionDto {
  static ModalidadAtencionDto convert(ModalidadAtencion modalidadAtencion) =>
      ModalidadAtencionDto(
          id: modalidadAtencion.id, descripcion: modalidadAtencion.descripcion);
}

class ConvertModalidadAtencionDtoToModalidadAtencionEntity {
  ConvertModalidadAtencionDtoToModalidadAtencionEntity(
      ModalidadAtencionDto modalidadAtencion);

  static ModalidadAtencionEntity convert(
          ModalidadAtencionDto modalidadAtencion) =>
      ModalidadAtencionEntity(
          id: modalidadAtencion.id, descripcion: modalidadAtencion.descripcion);
}
