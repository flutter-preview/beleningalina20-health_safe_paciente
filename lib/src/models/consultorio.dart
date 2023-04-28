class Consultorio {
  Consultorio({required this.id});

  int id;

  factory Consultorio.fromJson(Map<String, dynamic> json) =>
      Consultorio(id: json["id"]);
}
