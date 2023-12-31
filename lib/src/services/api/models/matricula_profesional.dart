import 'package:health_safe_paciente/src/services/api/models/models.dart';

class MatriculaProfesional {
  MatriculaProfesional({
    required this.id,
    required this.numeroMatricula,
    required this.tipoMatriculaProfesional,
    required this.universidad,
    required this.createdAt,
    required this.updatedAt,
    required this.anoOtorgamiento,
  });

  int id;
  int numeroMatricula;
  TipoMatriculaProfesional tipoMatriculaProfesional;
  Universidad universidad;
  DateTime createdAt;
  DateTime updatedAt;
  int anoOtorgamiento;

  factory MatriculaProfesional.fromJson(Map<String, dynamic> json) =>
      MatriculaProfesional(
        id: json["idmatriculaprofesional"],
        numeroMatricula: json["numero"],
        tipoMatriculaProfesional:
            TipoMatriculaProfesional.fromJson(json["tipomatricula"]),
        universidad: Universidad.fromJson(json["universidad"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        anoOtorgamiento: json["Profesionales_MatriculasProfesional"],
      );
}
