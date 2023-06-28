import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';

class ProfesionalDto {
  int id;
  String? descripcion;
  UsuarioDto usuario;
  List<EspecialidadDto> especialidades;

  bool disponible;
  List<AgendaTurnosDto> agendasTurnos = [];

  ProfesionalDto({
    required this.id,
    this.descripcion,
    this.disponible = true,
    required this.usuario,
    required this.especialidades,
  });

  factory ProfesionalDto.fromApi(Profesional profesional) => ProfesionalDto(
        id: profesional.id,
        usuario: UsuarioDto.fromApi(profesional.usuario),
        especialidades: List<EspecialidadDto>.from(profesional.especialidades
            .map((especialidad) =>
                EspecialidadDto.fromApi(especialidad.especialidad))),
      );

  @override
  String toString() =>
      "${(usuario.sexo == "M") ? "Dr." : "Dra."} ${usuario.nombre} ${usuario.apellido}";
}
