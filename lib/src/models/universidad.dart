class Universidad {
  Universidad(
      {required this.iduniversidad,
      required this.descripcion,
      this.createdAt,
      this.updatedAt});

  int iduniversidad;
  String descripcion;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Universidad.fromJson(Map<String, dynamic> json) => Universidad(
        iduniversidad: json["iduniversidad"],
        descripcion: json["descripcion"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
