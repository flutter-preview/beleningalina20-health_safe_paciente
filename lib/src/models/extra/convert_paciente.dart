import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/extra/mappers.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class ConvertPacienteToPacienteDto {
  static PacienteDto convert(Paciente paciente) => PacienteDto(
      id: paciente.id,
      usuario: ConvertUsuarioToUsuarioDto.convert(paciente.usuario),
      ocupacion: paciente.ocupacion);
}
