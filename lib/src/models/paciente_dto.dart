import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';

class PacienteDto {
  int id;
  UsuarioDto usuario;
  String ocupacion;

  PacienteDto(
      {required this.id, required this.usuario, required this.ocupacion});

  factory PacienteDto.fromApi(Paciente paciente) => PacienteDto(
      id: paciente.id,
      usuario: UsuarioDto.fromApi(paciente.usuario),
      ocupacion: paciente.ocupacion ?? '');
}
