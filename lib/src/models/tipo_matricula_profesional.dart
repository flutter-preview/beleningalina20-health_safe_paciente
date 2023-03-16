class TipoMatriculaProfesional {
  TipoMatriculaProfesional({
    required this.idtipomatricula,
    required this.descripcion,
    required this.createdAt,
    required this.updatedAt,
  });

  int idtipomatricula;
  String descripcion;
  DateTime createdAt;
  DateTime updatedAt;

  factory TipoMatriculaProfesional.fromJson(Map<String, dynamic> json) =>
      TipoMatriculaProfesional(
          idtipomatricula: json["idtipomatricula"],
          descripcion: json["descripcion"],
          createdAt: DateTime.parse(json["createdAt"]),
          updatedAt: DateTime.parse(json["updatedAt"]));
}
