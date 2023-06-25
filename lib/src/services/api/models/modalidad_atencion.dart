class ModalidadAtencion {
  int id;
  String descripcion;

  ModalidadAtencion({
    required this.id,
    required this.descripcion,
  });

  factory ModalidadAtencion.fromJson(Map<String, dynamic> json) =>
      ModalidadAtencion(
        id: json["idmodalidad"],
        descripcion: json["descripcion"],
      );
}
