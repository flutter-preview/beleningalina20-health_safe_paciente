import 'package:health_safe_paciente/src/models/models.dart';

class Profesional {
  Profesional(
      {required this.id,
      this.descripcion,
      required this.createdAt,
      required this.updatedAt,
      required this.usuario,
      required this.especialidades,
      required this.matriculasProfesionales,
      this.consultorioPrincipal = "~ No definido ~",
      this.rangoPrecioTurno = "~ No definido ~",
      this.calificacion = 0.0,
      this.cantidadOpiniones = 0,
      this.agendasTurnos = const []});

  int id;
  String? descripcion;
  DateTime createdAt;
  DateTime updatedAt;
  Usuario usuario;
  List<EspecialidadProfesional> especialidades;
  List<MatriculaProfesional> matriculasProfesionales;

  String consultorioPrincipal;
  String rangoPrecioTurno;
  double calificacion;
  int cantidadOpiniones;

  List<AgendaTurnos> agendasTurnos;

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
      consultorioPrincipal: json["consultorioPrincipal"],
      rangoPrecioTurno: json["rangoPrecioTurno"],
      calificacion: json["calificacion"],
      cantidadOpiniones: json["cantidadOpiniones"]);

  @override
  String toString() =>
      "${(usuario.sexo == "Masculino") ? "Dr." : "Dra."} ${usuario.nombre} ${usuario.apellido}";
}
