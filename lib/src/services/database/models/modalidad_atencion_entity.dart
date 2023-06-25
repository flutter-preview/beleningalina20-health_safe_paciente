class ModalidadAtencionEntity {
  ModalidadAtencionEntity({
    required this.id,
    required this.descripcion,
  });

  int id;
  String descripcion;

  Map<String, String> toJson() =>
      {'id': id.toString(), 'descripcion': descripcion.toString()};
}
