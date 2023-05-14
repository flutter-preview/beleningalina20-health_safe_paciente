import 'package:health_safe_paciente/src/models/core/core_models.dart';

class ProfesionalDto {
  ProfesionalDto(
      {required this.id,
      required this.usuario,
      required this.especialidades,
      required this.matriculasProfesionales});

  int id;
  UsuarioDto usuario;
  List<EspecialidadProfesionalDto> especialidades;
  List<MatriculaProfesionalDto> matriculasProfesionales;

  List<AgendaTurnosDto> agendasTurnos = [];

  @override
  String toString() =>
      "${(usuario.sexo == "Masculino") ? "Dr." : "Dra."} ${usuario.nombre} ${usuario.apellido}";
}
