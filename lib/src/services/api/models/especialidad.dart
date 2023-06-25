class Especialidad {
  int id;
  String descripcion;

  Especialidad({
    required this.id,
    required this.descripcion,
  });

  factory Especialidad.fromJson(Map<String, dynamic> json) => Especialidad(
        id: json["idespecialidad"],
        descripcion: json["descripcion"],
      );
}
