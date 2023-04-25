class Universidad {
  Universidad(
      {required this.id,
      required this.descripcion,
      this.createdAt,
      this.updatedAt});

  int id;
  String descripcion;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Universidad.fromJson(Map<String, dynamic> json) => Universidad(
        id: json["iduniversidad"],
        descripcion: json["descripcion"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
