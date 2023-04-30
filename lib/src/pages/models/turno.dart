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
      this.idConsultorio,
      this.disponible = true});

  int idAgendaTurnos;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  DateTime fecha;
  String nombreProfesional;
  String descripcionEspecialidadProfesional;
  String descripcionModalidadAtencion;
  int? idConsultorio; // nombre, direccion, localidad
  double precio;
  bool disponible;

  @override
  String toString() => "$fecha - $horaInicio $horaFin";
}
