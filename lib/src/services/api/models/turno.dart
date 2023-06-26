import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/extensions/extensions.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';

abstract class Turno {
  Turno({
    required this.id,
    required this.fecha,
    required this.horaInicio,
    required this.horaFin,
    /*required this.fechaSolicita,
      required this.especialidad,
      required this.precio,
      this.idPago,
      this.agendaTurnos*/
  });

  int id;
  DateTime fecha;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  // DateTime fechaSolicita;

  /*Especialidad especialidad;

  double precio;
  String? idPago;

  AgendaTurnos? agendaTurnos;

  int? idPaciente;*/

  /*factory Turno.fromJson(Map<String, dynamic> json) => Turno(
      id: json["idturno"],
      fecha: DateTime.parse(json["fecha"]),
      horaInicio: json["horainicio"].toTimeOfDay(),
      horaFin: json["horafin"].toTimeOfDay(),
      fechaSolicita: DateTime.parse(json["fechasolicita"]),
      especialidad: Especialidad.fromJson(json["especialidad"]),
      precio: json["precio"],
      idPago: json["idPago"],
      agendaTurnos: AgendaTurnos.fromJson(json["agendaturnos"]));*/
}

class TurnoReservado extends Turno {
  TurnoReservado(
      {required super.id,
      required super.fecha,
      required super.horaInicio,
      required super.horaFin});

  factory TurnoReservado.fromJson(Map<String, dynamic> json) => TurnoReservado(
      id: json['id'],
      fecha: DateTime.parse(json['fecha']),
      horaInicio: json['horaInicio'].toString().toTimeOfDay(),
      horaFin: json['horaFin'].toString().toTimeOfDay());
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
      {required super.id,
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
      id: json['id'],
      fecha: DateTime.parse(json['fecha']),
      horaInicio: json['horaInicio'].toString().toTimeOfDay(),
      horaFin: json['horaFin'].toString().toTimeOfDay(),
      profesional: Profesional.fromJson(json['profesional']),
      especialidad: Especialidad.fromJson(json['especialidad']),
      fechaSolicita: DateTime.parse(json['fechasolicit']),
      modalidadAtencion: ModalidadAtencion.fromJson(json['modalidadatencion']),
      consultorio: (json['consultorio'] != null)
          ? Consultorio.fromJson(json['consultorio'])
          : null,
      idPago: json['idPago'],
      precio: json['precio']);
}
