import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

ObtenerTurnosResponse obtenreTurnosResponseMock =
    ObtenerTurnosResponse(turnos: [
  Turno(
      id: 0,
      fecha: DateTime(2023, 04, 20),
      horaInicio: const TimeOfDay(hour: 10, minute: 00),
      horaFin: const TimeOfDay(hour: 10, minute: 30),
      idPago: "id_pago_0",
      fechaSolicita: DateTime.now(),
      especialidad: Especialidad(id: 0, descripcion: "Medico General"),
      agendaTurnos: AgendaTurnos(
          id: 0,
          fechaDesde: DateTime(2023, 05, 20),
          horaInicio: const TimeOfDay(hour: 10, minute: 00),
          horaFin: const TimeOfDay(hour: 16, minute: 00),
          duracion: 30,
          modalidadAtencion:
              ModalidadAtencion(id: 0, descripcion: "Videollamada"),
          precio: 100.50,
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
              /*consultorioPrincipal: "Clínica de Mayo - 9 de Julio 754",
              rangoPrecioTurno: "\$1000 - \$1500",
              calificacion: 2.3,
              cantidadOpiniones: 15,*/
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
              ]))),
  Turno(
      id: 1,
      fecha: DateTime(2023, 05, 21),
      horaInicio: const TimeOfDay(hour: 10, minute: 30),
      horaFin: const TimeOfDay(hour: 11, minute: 00),
      idPago: "id_pago_1",
      fechaSolicita: DateTime.now(),
      especialidad: Especialidad(id: 0, descripcion: "Cardiología"),
      agendaTurnos: AgendaTurnos(
          id: 0,
          fechaDesde: DateTime(2023, 05, 20),
          fechaHasta: DateTime(2023, 05, 25),
          horaInicio: const TimeOfDay(hour: 10, minute: 00),
          horaFin: const TimeOfDay(hour: 16, minute: 00),
          duracion: 30,
          modalidadAtencion:
              ModalidadAtencion(id: 0, descripcion: "Videollamada"),
          precio: 100.50,
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
              /*consultorioPrincipal: "Clínica de Mayo - 9 de Julio 754",
              rangoPrecioTurno: "\$1000 - \$1500",
              calificacion: 2.3,
              cantidadOpiniones: 15,*/
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
              ]))),
  Turno(
      id: 2,
      fecha: DateTime(2023, 05, 23),
      horaInicio: const TimeOfDay(hour: 10, minute: 00),
      horaFin: const TimeOfDay(hour: 10, minute: 30),
      idPago: "id_pago_2",
      fechaSolicita: DateTime.now(),
      especialidad: Especialidad(id: 0, descripcion: "Medico Clinico"),
      agendaTurnos: AgendaTurnos(
          id: 0,
          fechaDesde: DateTime(2023, 05, 20),
          fechaHasta: DateTime(2023, 05, 25),
          horaInicio: const TimeOfDay(hour: 10, minute: 00),
          horaFin: const TimeOfDay(hour: 16, minute: 00),
          duracion: 30,
          modalidadAtencion:
              ModalidadAtencion(id: 0, descripcion: "Videollamada"),
          precio: 100.50,
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
              /*consultorioPrincipal: "Clínica de Mayo - 9 de Julio 754",
              rangoPrecioTurno: "\$1000 - \$1500",
              calificacion: 2.3,
              cantidadOpiniones: 15,*/
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
              ]))),
  Turno(
      id: 3,
      fecha: DateTime(2023, 05, 23),
      horaInicio: const TimeOfDay(hour: 11, minute: 30),
      horaFin: const TimeOfDay(hour: 12, minute: 00),
      idPago: "id_pago_3",
      fechaSolicita: DateTime.now(),
      especialidad: Especialidad(id: 0, descripcion: "Cardiologia"),
      agendaTurnos: AgendaTurnos(
          id: 0,
          fechaDesde: DateTime(2023, 05, 20),
          fechaHasta: DateTime(2023, 05, 25),
          horaInicio: const TimeOfDay(hour: 10, minute: 00),
          horaFin: const TimeOfDay(hour: 16, minute: 00),
          duracion: 30,
          modalidadAtencion:
              ModalidadAtencion(id: 0, descripcion: "Videollamada"),
          precio: 100.50,
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
              /*consultorioPrincipal: "Clínica de Mayo - 9 de Julio 754",
              rangoPrecioTurno: "\$1000 - \$1500",
              calificacion: 2.3,
              cantidadOpiniones: 15,*/
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
              ]))),
  Turno(
      id: 4,
      fecha: DateTime(2023, 05, 25),
      horaInicio: const TimeOfDay(hour: 15, minute: 30),
      horaFin: const TimeOfDay(hour: 16, minute: 00),
      idPago: "id_pago_4",
      fechaSolicita: DateTime.now(),
      especialidad: Especialidad(id: 0, descripcion: "Médico General"),
      agendaTurnos: AgendaTurnos(
          id: 0,
          fechaDesde: DateTime(2023, 05, 20),
          fechaHasta: DateTime(2023, 05, 25),
          horaInicio: const TimeOfDay(hour: 10, minute: 00),
          horaFin: const TimeOfDay(hour: 16, minute: 00),
          consultorio: Consultorio(
              id: 0,
              direccion: Direccion(
                  id: 0,
                  calle: "Laprida",
                  numero: 589,
                  localidad: Localidad(
                      codigoPostal: 4000,
                      descripcion: "San Miguel de Tucuman"))),
          duracion: 30,
          modalidadAtencion:
              ModalidadAtencion(id: 0, descripcion: "Presencial"),
          precio: 100.50,
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
              /*consultorioPrincipal: "Clínica de Mayo - 9 de Julio 754",
              rangoPrecioTurno: "\$1000 - \$1500",
              calificacion: 2.3,
              cantidadOpiniones: 15,*/
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
              ]))),
]);
