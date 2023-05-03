import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';

CrearTurnoResponse crearTurnoResponseMock = CrearTurnoResponse(
    msg: "Turno dado de alta",
    turno: Turno(
        fechaSolicita: DateTime(2023, 05, 01),
        idPago: "id_pago_mercado_pago",
        id: 2,
        fecha: DateTime(2023, 06, 04),
        horaInicio: const TimeOfDay(hour: 10, minute: 00),
        horaFin: const TimeOfDay(hour: 10, minute: 30),
        especialidad: Especialidad(
          id: 1,
          descripcion: "Médico General",
        ),
        agendaTurnos: AgendaTurnos(
            id: 2,
            fechaDesde: DateTime(2023, 06, 03),
            fechaHasta: DateTime(2023, 06, 15),
            horaInicio: const TimeOfDay(hour: 10, minute: 00),
            horaFin: const TimeOfDay(hour: 15, minute: 00),
            duracion: 30,
            precio: 100.5,
            modalidadAtencion:
                ModalidadAtencion(id: 1, descripcion: "Videollamada"),
            consultorio: null,
            profesional: Profesional(
                id: 1,
                createdAt: DateTime(2023, 03, 14, 0, 34, 22),
                updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
                usuario: Usuario(
                  id: 1,
                  correo: "mariajuarez@gmail.com",
                  contrasena: "",
                  dni: 34564234,
                  nombre: "Maria",
                  apellido: "Juarez",
                  fechaNacimiento: DateTime(1990, 04, 23),
                  sexo: "Femenino",
                  imagenPerfil:
                      'https://res.cloudinary.com/healthsafeapp/image/upload/v1678944556/profesional_avatar_2_xhik8b.jpg',
                  imagenDniFrente: "",
                  imagenDniDorso: "",
                  rol: Rol(id: 1, descripcion: "Profesional"),
                  createdAt: DateTime(2023, 03, 14, 0, 34, 22),
                  updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
                ),
                consultorioPrincipal: "Clínica de Mayo - 9 de Julio 754",
                rangoPrecioTurno: "\$1000 - \$1500",
                calificacion: 2.3,
                cantidadOpiniones: 15,
                especialidades: [
                  EspecialidadProfesional(
                      especialidad: Especialidad(
                        id: 1,
                        descripcion: "Médico General",
                        createdAt: DateTime(2023, 03, 14, 0, 34, 22),
                        updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
                      ),
                      anoOtorgamiento: 2010),
                  EspecialidadProfesional(
                      especialidad: Especialidad(
                        id: 2,
                        descripcion: "Cardiología",
                        createdAt: DateTime(2023, 03, 14, 0, 34, 22),
                        updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
                      ),
                      anoOtorgamiento: 2013)
                ],
                matriculasProfesionales: [
                  MatriculaProfesional(
                      id: 1,
                      numeroMatricula: 123456,
                      tipoMatriculaProfesional: TipoMatriculaProfesional(
                        id: 1,
                        descripcion: "MN",
                        createdAt: DateTime(2023, 03, 14, 0, 34, 22),
                        updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
                      ),
                      universidad: Universidad(id: 1, descripcion: "UNT"),
                      createdAt: DateTime(2023, 03, 14, 0, 34, 22),
                      updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
                      anoOtorgamiento: 2010),
                  MatriculaProfesional(
                      id: 2,
                      numeroMatricula: 123457,
                      tipoMatriculaProfesional: TipoMatriculaProfesional(
                        id: 2,
                        descripcion: "MP - Tucumán",
                        createdAt: DateTime(2023, 03, 14, 0, 34, 22),
                        updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
                      ),
                      universidad: Universidad(
                          id: 1, descripcion: "Universidad San Pablo - T"),
                      createdAt: DateTime(2023, 03, 14, 0, 34, 22),
                      updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
                      anoOtorgamiento: 2013),
                ]))));
