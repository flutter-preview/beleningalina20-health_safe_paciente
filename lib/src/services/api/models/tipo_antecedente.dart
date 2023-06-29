class TipoAntecedente {
  int id;
  String descripcion;

  TipoAntecedente({required this.id, required this.descripcion});

  factory TipoAntecedente.fromJson(Map<String, dynamic> json) =>
      TipoAntecedente(
          id: json['idtipoantecedente'], descripcion: json['descripcion']);
}
