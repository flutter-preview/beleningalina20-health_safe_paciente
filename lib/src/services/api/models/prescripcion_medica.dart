class PrescripcionMedica {
  int id;
  String descripcion;

  PrescripcionMedica({required this.id, required this.descripcion});

  factory PrescripcionMedica.fromJson(Map<String, dynamic> json) =>
      PrescripcionMedica(
          id: json['idprescripcion'], descripcion: json['descripcion']);
}
