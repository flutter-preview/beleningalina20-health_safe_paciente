class Localidad {
  String codigoPostal;
  String descripcion;

  Localidad({
    required this.codigoPostal,
    required this.descripcion,
  });

  factory Localidad.fromJson(Map<String, dynamic> json) => Localidad(
        codigoPostal: json["codpostal"],
        descripcion: json["descripcion"],
      );
}
