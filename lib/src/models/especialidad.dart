class Especialidad {
  int id;
  String descripcion;
  DateTime? createdAt;
  DateTime? updatedAt;

  Especialidad({
    required this.id,
    required this.descripcion,
    this.createdAt,
    this.updatedAt,
  });

  factory Especialidad.fromJson(Map<String, dynamic> json) => Especialidad(
        id: json["idespecialidad"],
        descripcion: json["descripcion"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  @override
  String toString() => descripcion;
}
