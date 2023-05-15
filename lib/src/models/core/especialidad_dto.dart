class EspecialidadDto {
  EspecialidadDto({required this.id, required this.descripcion});

  int id;
  String descripcion;

  @override
  String toString() => descripcion;
}
