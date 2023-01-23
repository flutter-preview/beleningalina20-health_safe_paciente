class Rol {
  Rol({
    required this.idrol,
    required this.descripcion,
    this.createdAt,
    this.updatedAt,
  });

  int idrol;
  String descripcion;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Rol.fromJson(Map<String, dynamic> json) => Rol(
        idrol: json["idrol"],
        descripcion: json["descripcion"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}