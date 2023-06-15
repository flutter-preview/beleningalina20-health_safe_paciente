import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class Turno {
  Turno(
      {this.id,
      required this.fecha,
      required this.horaInicio,
      required this.horaFin,
      required this.fechaSolicita,
      required this.especialidad,
      this.idPago,
      this.agendaTurnos});

  int? id;
  DateTime fecha;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  DateTime fechaSolicita;

  Especialidad especialidad;

  double? precio;
  String? idPago;

  AgendaTurnos? agendaTurnos;

  int? idPaciente;

  factory Turno.fromJson(Map<String, dynamic> json) => Turno(
      id: json["idturno"],
      fecha: DateTime.parse(json["fecha"]),
      horaInicio: json["horainicio"].toTimeOfDay(),
      horaFin: json["horafin"].toTimeOfDay(),
      fechaSolicita: DateTime.parse(json["fechasolicita"]),
      especialidad: Especialidad.fromJson(json["especialidad"]),
      idPago: json["idPago"],
      agendaTurnos: AgendaTurnos.fromJson(json["agendaturnos"]));

  String toJson() => jsonEncode({});
}
