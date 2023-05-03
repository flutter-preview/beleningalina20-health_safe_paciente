import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class Turno {
  Turno(
      {required this.id,
      required this.fecha,
      required this.horaInicio,
      required this.horaFin,
      required this.fechaSolicita,
      this.especialidad,
      this.idPago,
      this.agendaTurnos});

  int id;
  DateTime fecha;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  DateTime fechaSolicita;

  Especialidad? especialidad;

  // Para paciente
  String? idPago;
  AgendaTurnos? agendaTurnos;

  // Para profesional

  factory Turno.fromJson(Map<String, dynamic> json) => Turno(
      id: json["idturno"],
      fecha: DateTime.parse(json["fecha"]),
      horaInicio: json["horainicio"].toTimeOfDay(),
      horaFin: json["horafin"].toTimeOfDay(),
      fechaSolicita: DateTime.parse(json["fechasolicita"]),
      especialidad: Especialidad.fromJson(json["especialidad"]),
      idPago: json["idPago"],
      agendaTurnos: AgendaTurnos.fromJson(json["agendaturnos"]));
}
