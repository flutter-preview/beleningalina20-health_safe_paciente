class RolEntity {
  RolEntity({required this.id, required this.descripcion});

  int id;
  String descripcion;

  factory RolEntity.fromJson(Map<String, dynamic> json) =>
      RolEntity(id: json["id"], descripcion: json["descripcion"]);
}
