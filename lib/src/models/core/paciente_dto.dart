import 'package:health_safe_paciente/src/models/core/core_models.dart';

class PacienteDto {
  PacienteDto({required this.id, required this.usuario, this.ocupacion});

  int id;
  UsuarioDto usuario;
  String? ocupacion;
}
