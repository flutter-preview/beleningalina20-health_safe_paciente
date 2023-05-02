import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class Turno {
  Turno({
    required this.id,
    required this.idPago,
    required this.fecha,
    required this.horaInicio,
    required this.horaFin,
    required this.fechaSolicita,
    this.paciente,
  });

  int id;
  String idPago;
  DateTime fecha;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  DateTime fechaSolicita;
  Paciente? paciente;

  factory Turno.fromJson(Map<String, dynamic> json) => Turno(
      id: json["idturno"],
      idPago: json["idpago"],
      fecha: DateTime.parse(json["fecha"]),
      horaInicio: json["horainicio"].toTimeOfDay(),
      horaFin: json["horafin"].toTimeOfDay(),
      fechaSolicita: DateTime.parse(json["fechasolicita"]),
      paciente: Paciente.fromJson(json["idpaciente"]));
}
