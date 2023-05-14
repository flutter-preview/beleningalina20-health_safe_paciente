class LocalidadDto {
  LocalidadDto({required this.codigoPostal, required this.descripcion});

  int codigoPostal;
  String descripcion;

  @override
  String toString() => descripcion;
}
