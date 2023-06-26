import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/extensions/extensions.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';

class AgendaTurnos {
  AgendaTurnos({
    required this.id,
    required this.fechaDesde,
    this.fechaHasta,
    required this.horaInicio,
    required this.horaFin,
    required this.duracion,
    required this.precio,
    required this.modalidadAtencion,
    this.consultorio,
    this.turnosReservados = const [],
  });

  int id;
  DateTime fechaDesde;
  DateTime? fechaHasta;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  int duracion;
  double precio;
  ModalidadAtencion modalidadAtencion;
  Consultorio? consultorio;

  List<TurnoReservado> turnosReservados;

  factory AgendaTurnos.fromJson(Map<String, dynamic> json) => AgendaTurnos(
        id: json["idagenda"],
        fechaDesde: DateTime.parse(json["fechadesde"]),
        fechaHasta: (json["fechahasta"] != null)
            ? DateTime.parse(json["fechahasta"])
            : null,
        horaInicio: json["horainicio"].toString().toTimeOfDay(),
        horaFin: json["horafin"].toString().toTimeOfDay(),
        duracion: json["duracion"],
        precio: json["precio"]?.toDouble(),
        modalidadAtencion: ModalidadAtencion.fromJson(json["modalidad"]),
        consultorio: (json["consultorio"] != null)
            ? Consultorio.fromJson(json["consultorio"])
            : null,
        turnosReservados: List<TurnoReservado>.from(
            json["turnos"].map((x) => TurnoReservado.fromJson(x))),
      );
}
