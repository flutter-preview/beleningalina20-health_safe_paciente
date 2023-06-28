class Rol {
  Rol({
    required this.id,
    required this.descripcion,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String descripcion;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Rol.fromJson(Map<String, dynamic> json) => Rol(
        id: json["idrol"],
        descripcion: json["descripcion"],
        createdAt: (json["createdAt"] != null)
            ? DateTime.parse(json["createdAt"])
            : null,
        updatedAt: (json["updatedAt"] != null)
            ? DateTime.parse(json["updatedAt"])
            : null,
      );
}
