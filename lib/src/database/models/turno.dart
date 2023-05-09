import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/database/models/local.dart';

class Turno {
  Turno({
    required this.id,
    required this.fecha,
    required this.fechaSolicita,
    required this.horaInicio,
    required this.horaFin,
    required this.precio,
    required this.idPago,
    required this.idAgendaTurnos,
    required this.especialidad,
    required this.modalidadAtencion,
    required this.profesional,
    this.consultorio,
  });

  int id;
  DateTime fecha;
  DateTime fechaSolicita;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  double precio;
  String idPago;

  int idAgendaTurnos;

  Especialidad especialidad;
  ModalidadAtencion modalidadAtencion;
  Consultorio? consultorio;
  Profesional profesional;

  Map<String, String> toJson() => {
        'id': id.toString(),
        'fecha': fecha.toString(),
        'fechaSolicita': fechaSolicita.toString(),
        'horaInicio': horaInicio.toString(),
        'horaFin': horaFin.toString(),
        'precio': precio.toString(),
        'idPago': idPago,
        'idAgendaTurnos': idAgendaTurnos.toString(),
        'idModalidadAtencion': modalidadAtencion.id.toString(),
        'idConsultorio': consultorio?.id.toString() ?? '',
        'idEspecialidad': especialidad.id.toString(),
        'idProfesional': profesional.id.toString()
      };
}
