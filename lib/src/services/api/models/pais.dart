class Pais {
  int id;
  String descripcion;
  DateTime? createdAt;
  DateTime? updatedAt;

  Pais(
      {required this.id,
      required this.descripcion,
      this.createdAt,
      this.updatedAt});

  factory Pais.fromJson(Map<String, dynamic> json) => Pais(
        id: json['idpais'],
        descripcion: json['descripcion'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );
}
