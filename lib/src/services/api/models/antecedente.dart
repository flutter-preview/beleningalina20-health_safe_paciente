import 'package:health_safe_paciente/src/services/api/models/models.dart';

class Antecedente {
  int id;
  TipoAntecedente tipoAntecedente;
  Paciente paciente;
  String descripcion;

  Antecedente(
      {required this.id,
      required this.tipoAntecedente,
      required this.paciente,
      required this.descripcion});

  factory Antecedente.fromJson(Map<String, dynamic> json) => Antecedente(
      id: json['idantecedente'],
      tipoAntecedente: TipoAntecedente.fromJson(json['tipoantecedente']),
      paciente: Paciente.fromJson(json['paciente']),
      descripcion: json['descripcion']);
}
