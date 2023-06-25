class TipoMatriculaProfesional {
  TipoMatriculaProfesional({
    required this.id,
    required this.descripcion,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String descripcion;
  DateTime createdAt;
  DateTime updatedAt;

  factory TipoMatriculaProfesional.fromJson(Map<String, dynamic> json) =>
      TipoMatriculaProfesional(
          id: json["idtipomatricula"],
          descripcion: json["descripcion"],
          createdAt: DateTime.parse(json["createdAt"]),
          updatedAt: DateTime.parse(json["updatedAt"]));
}
