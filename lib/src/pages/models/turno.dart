import 'package:flutter/material.dart';

class Turno {
  Turno(
      {required this.idAgendaTurnos,
      required this.horaInicio,
      required this.horaFin,
      required this.fecha,
      required this.nombreProfesional,
      required this.descripcionEspecialidadProfesional,
      required this.descripcionModalidadAtencion,
      required this.precio,
      this.descripcionConsultorio,
      required this.idEspecialidad,
      this.disponible = true,
      this.comentario = ""});

  int idAgendaTurnos;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  DateTime fecha;
  String nombreProfesional;
  String descripcionEspecialidadProfesional;
  String descripcionModalidadAtencion;
  String? descripcionConsultorio;
  double precio;
  bool disponible;
  int idEspecialidad;

  String comentario;

  @override
  String toString() => "$fecha - $horaInicio $horaFin";
}
