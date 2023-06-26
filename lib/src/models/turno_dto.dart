import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/database/models/models.dart';

abstract class TurnoDto {
  DateTime fecha;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;

  TurnoDto({
    required this.fecha,
    required this.horaInicio,
    required this.horaFin,
  });
}

class TurnoReservadoDto extends TurnoDto {
  bool disponible;
  TurnoReservadoDto(
      {required super.fecha,
      required super.horaInicio,
      required super.horaFin,
      this.disponible = false});

  factory TurnoReservadoDto.fromApi(Turno turno) => TurnoReservadoDto(
      fecha: turno.fecha, horaInicio: turno.horaInicio, horaFin: turno.horaFin);
}

class TurnoPacienteDto extends TurnoDto {
  int id;
  ProfesionalDto profesional;
  ModalidadAtencionDto modalidadAtencion;
  ConsultorioDto? consultorio;
  DateTime fechaSolicita;
  String idPago;
  double precio;
  EspecialidadDto especialidad;

  TurnoPacienteDto(
      {required super.fecha,
      required super.horaInicio,
      required super.horaFin,
      required this.id,
      required this.profesional,
      required this.modalidadAtencion,
      this.consultorio,
      required this.fechaSolicita,
      required this.idPago,
      required this.precio,
      required this.especialidad});

  factory TurnoPacienteDto.fromApi(TurnoPaciente turno) => TurnoPacienteDto(
      fecha: turno.fecha,
      horaInicio: turno.horaInicio,
      horaFin: turno.horaFin,
      fechaSolicita: turno.fechaSolicita,
      modalidadAtencion: ModalidadAtencionDto.fromApi(turno.modalidadAtencion),
      profesional: ProfesionalDto.fromApi(turno.profesional),
      id: turno.id,
      idPago: turno.idPago,
      precio: turno.precio,
      especialidad: EspecialidadDto.fromApi(turno.especialidad));

  TurnoEntity toEntity() => TurnoEntity(
      id: id,
      especialidad: especialidad.toEntity(),
      fecha: fecha,
      fechaSolicita: fechaSolicita,
      horaFin: horaFin,
      horaInicio: horaInicio,
      idPago: idPago,
      modalidadAtencion: modalidadAtencion.toEntity(),
      precio: precio,
      profesional: profesional.toEntity(),
      consultorio: consultorio?.toEntity());
}
