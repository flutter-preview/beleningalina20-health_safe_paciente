import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';

class ProfesionalDto {
  int id;
  String? descripcion;
  UsuarioDto usuario;
  double calificacion;
  int cantidadCalificaciones;

  List<EspecialidadDto> especialidades;

  bool disponible;
  List<AgendaTurnosDto> agendasTurnos = [];

  ProfesionalDto(
      {required this.id,
      this.descripcion,
      this.disponible = true,
      required this.usuario,
      this.especialidades = const [],
      required this.calificacion,
      required this.cantidadCalificaciones});

  factory ProfesionalDto.fromApi(Profesional profesional) => ProfesionalDto(
        id: profesional.id,
        usuario: UsuarioDto.fromApi(profesional.usuario),
        calificacion: profesional.calificacion,
        cantidadCalificaciones: profesional.cantidadCalificaciones,
        especialidades: List<EspecialidadDto>.from(profesional.especialidades
            .map((especialidad) =>
                EspecialidadDto.fromApi(especialidad.especialidad))),
      );

  @override
  String toString() =>
      "${(usuario.sexo == "M") ? "Dr." : "Dra."} ${usuario.nombre} ${usuario.apellido}";
}
