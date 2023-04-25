class ModalidadAtencion {
  int id;
  String descripcion;
  DateTime? createdAt;
  DateTime? updatedAt;

  ModalidadAtencion({
    required this.id,
    required this.descripcion,
    this.createdAt,
    this.updatedAt,
  });

  factory ModalidadAtencion.fromJson(Map<String, dynamic> json) =>
      ModalidadAtencion(
        id: json["idmodalidad"],
        descripcion: json["descripcion"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  @override
  String toString() => descripcion;
}
