import 'package:health_safe_paciente/src/services/api/models/models.dart';

class Episodio {
  int id;
  String descripcion;
  DateTime fechaCreacion;
  HistoriaClinica historiaClinica;
  PrescripcionMedica? prescripcionMedica;
  IndicacionMedica? indicacionMedica;
  TurnoPaciente turno;

  Episodio({
    required this.id,
    required this.descripcion,
    required this.fechaCreacion,
    required this.historiaClinica,
    this.prescripcionMedica,
    this.indicacionMedica,
    required this.turno,
  });

  factory Episodio.fromJson(Map<String, dynamic> json) => Episodio(
      id: json['idepisodio'],
      descripcion: json['descripcion'],
      fechaCreacion: DateTime.parse(json['fechahora']),
      historiaClinica: HistoriaClinica.fromJson(json['historiaclinica']),
      turno: TurnoPaciente.fromJson(json['turno']),
      prescripcionMedica: PrescripcionMedica.fromJson(json['prescripcion']),
      indicacionMedica: IndicacionMedica.fromJson(json['indicacion']));
}
