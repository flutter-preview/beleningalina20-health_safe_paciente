class IndicacionMedica {
  int id;
  String descripcion;

  IndicacionMedica({required this.id, required this.descripcion});

  factory IndicacionMedica.fromJson(Map<String, dynamic> json) =>
      IndicacionMedica(
          id: json['idindicacion'], descripcion: json['descripcion']);
}
