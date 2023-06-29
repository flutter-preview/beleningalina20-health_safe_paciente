class HistoriaClinica {
  int id;

  double? peso;
  double? altura;
  HistoriaClinica({required this.id, this.peso, this.altura});

  factory HistoriaClinica.fromJson(Map<String, dynamic> json) =>
      HistoriaClinica(
          id: json['idhistoriaclinica'],
          peso: json['peso'],
          altura: json['altura']);
}
