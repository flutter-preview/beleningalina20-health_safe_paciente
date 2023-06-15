import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class AgendaTurnos {
  AgendaTurnos(
      {required this.id,
      required this.fechaDesde,
      this.fechaHasta,
      required this.horaInicio,
      required this.horaFin,
      required this.duracion,
      required this.precio,
      required this.modalidadAtencion,
      this.consultorio,
      this.turnosReservados = const [],
      this.profesional});

  int id;
  DateTime fechaDesde;
  DateTime? fechaHasta;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  int duracion;
  double precio;
  ModalidadAtencion modalidadAtencion;
  Consultorio? consultorio;

  List<Turno> turnosReservados;

  Profesional? profesional;

  factory AgendaTurnos.fromJson(Map<String, dynamic> json) => AgendaTurnos(
      id: json["idagenda"],
      fechaDesde: DateTime.parse(json["fechadesde"]),
      fechaHasta: DateTime.parse(json["fechahasta"]),
      horaInicio: json["horainicio"].toTimeOfDay(),
      horaFin: json["horafin"].toTimeOfDay(),
      duracion: json["duracion"],
      precio: json["precio"]?.toDouble(),
      modalidadAtencion: ModalidadAtencion.fromJson(json["modalidad"]),
      consultorio: Consultorio.fromJson(json["consultorio"]),
      turnosReservados:
          List<Turno>.from(json["turnos"].map((x) => Turno.fromJson(x))),
      profesional: Profesional.fromJson(json["profesional"]));
}
