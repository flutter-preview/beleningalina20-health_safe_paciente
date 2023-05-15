import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class Profesional {
  Profesional({
    required this.id,
    this.descripcion,
    required this.createdAt,
    required this.updatedAt,
    required this.usuario,
    required this.especialidades,
    required this.matriculasProfesionales,
  });

  int id;
  String? descripcion;
  DateTime createdAt;
  DateTime updatedAt;
  Usuario usuario;
  List<EspecialidadProfesional> especialidades;
  List<MatriculaProfesional> matriculasProfesionales;

  // List<AgendaTurnos> agendasTurnos;

  factory Profesional.fromJson(Map<String, dynamic> json) => Profesional(
        id: json["idprofesional"],
        descripcion: json["descripcion"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        usuario: Usuario.fromJson(json["usuario"]),
        especialidades: List<EspecialidadProfesional>.from(
            json["PE_especialidades"]
                .map((x) => EspecialidadProfesional.fromJson(x))),
        matriculasProfesionales: List<MatriculaProfesional>.from(
            json["PM_matriculas_profesionales"]
                .map((x) => MatriculaProfesional.fromJson(x))),
      );
}

// TODO Preguntar por: calificacion, cantidad de opiniones, consultorio descripcion, listado de modalidad de atencion que tiene agendas programadas