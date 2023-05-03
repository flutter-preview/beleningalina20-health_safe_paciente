import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';

ObtenerAgendasTurnosResponse obtenerAgendasTurnosResponseMock =
    ObtenerAgendasTurnosResponse(agendasTurnos: [
  AgendaTurnos(
      id: 1,
      fechaDesde: DateTime(2023, 05, 25),
      horaInicio: const TimeOfDay(hour: 10, minute: 00),
      horaFin: const TimeOfDay(hour: 15, minute: 00),
      duracion: 30,
      precio: 100.5,
      modalidadAtencion: ModalidadAtencion(id: 1, descripcion: "Videollamada"),
      consultorio: null,
      turnosReservados: []),
  AgendaTurnos(
      id: 2,
      fechaDesde: DateTime(2023, 06, 03),
      fechaHasta: DateTime(2023, 06, 15),
      horaInicio: const TimeOfDay(hour: 10, minute: 00),
      horaFin: const TimeOfDay(hour: 15, minute: 00),
      duracion: 30,
      precio: 100.5,
      modalidadAtencion: ModalidadAtencion(id: 1, descripcion: "Videollamada"),
      consultorio: null,
      turnosReservados: [
        Turno(
            id: 2,
            fecha: DateTime(2023, 06, 10),
            horaInicio: const TimeOfDay(hour: 10, minute: 00),
            horaFin: const TimeOfDay(hour: 10, minute: 30),
            fechaSolicita: DateTime(2023, 06, 01))
      ]),
]);
