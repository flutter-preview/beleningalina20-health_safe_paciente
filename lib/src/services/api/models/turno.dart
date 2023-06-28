import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/extensions/extensions.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';

abstract class Turno {
  Turno({
    this.id,
    required this.fecha,
    required this.horaInicio,
    required this.horaFin,
  });

  int? id;
  DateTime fecha;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
}

class TurnoReservado extends Turno {
  TurnoReservado(
      {super.id,
      required super.fecha,
      required super.horaInicio,
      required super.horaFin});

  factory TurnoReservado.fromJson(Map<String, dynamic> json) => TurnoReservado(
      id: json['idturno'],
      fecha: DateTime.parse(json['fecha']),
      horaInicio: json['horainicio'].toString().toTimeOfDay(),
      horaFin: json['horafin'].toString().toTimeOfDay());
}

class TurnoPaciente extends Turno {
  Profesional profesional;
  DateTime fechaSolicita;
  ModalidadAtencion modalidadAtencion;
  Consultorio? consultorio;
  Especialidad especialidad;
  double precio;
  String idPago;

  TurnoPaciente(
      {super.id,
      required super.fecha,
      required super.horaInicio,
      required super.horaFin,
      required this.profesional,
      required this.especialidad,
      required this.fechaSolicita,
      required this.idPago,
      required this.precio,
      required this.modalidadAtencion,
      this.consultorio});

  factory TurnoPaciente.fromJson(Map<String, dynamic> json) => TurnoPaciente(
      id: json['idturno'],
      fecha: DateTime.parse(json['fecha']),
      horaInicio: json['horainicio'].toString().toTimeOfDay(),
      horaFin: json['horafin'].toString().toTimeOfDay(),
      profesional: Profesional.fromJson(json['profesional']),
      especialidad: Especialidad.fromJson(json['especialidad']),
      fechaSolicita: DateTime.parse(json['fechasolicita']),
      modalidadAtencion: ModalidadAtencion.fromJson(json['modalidadatencion']),
      consultorio: (json['consultorio'] != null)
          ? Consultorio.fromJson(json['consultorio'])
          : null,
      idPago: json['idPago'],
      precio: json['precio']);
}
