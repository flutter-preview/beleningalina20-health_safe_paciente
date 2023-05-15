class LocalidadEntity {
  LocalidadEntity({
    required this.codigoPostal,
    required this.descripcion,
  });

  int codigoPostal;
  String descripcion;

  Map<String, String> toJson() => {
        'codigoPostal': codigoPostal.toString(),
        'descripcion': descripcion.toString()
      };
}
