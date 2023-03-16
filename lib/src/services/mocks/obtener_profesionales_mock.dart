import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/models/responses/obtener_profesionales_response.dart';

ObtenerProfesionalesResponse obtenerProfesionalesResponseMock =
    ObtenerProfesionalesResponse(profesionales: [
  Profesional(
      idprofesional: 1,
      createdAt: DateTime(2023, 03, 14, 0, 34, 22),
      updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
      usuario: Usuario(
        idusuario: 1,
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
        rol: Rol(idrol: 1, descripcion: "Profesional"),
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
              idEspecialidad: 1,
              descripcion: "Médico General",
              createdAt: DateTime(2023, 03, 14, 0, 34, 22),
              updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
            ),
            anoOtorgamiento: 2010),
        EspecialidadProfesional(
            especialidad: Especialidad(
              idEspecialidad: 2,
              descripcion: "Cardiología",
              createdAt: DateTime(2023, 03, 14, 0, 34, 22),
              updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
            ),
            anoOtorgamiento: 2013)
      ],
      matriculasProfesionales: [
        MatriculaProfesional(
            idmatriculaprofesional: 1,
            numeroMatricula: 123456,
            tipoMatriculaProfesional: TipoMatriculaProfesional(
              idtipomatricula: 1,
              descripcion: "MN",
              createdAt: DateTime(2023, 03, 14, 0, 34, 22),
              updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
            ),
            universidad: Universidad(iduniversidad: 1, descripcion: "UNT"),
            createdAt: DateTime(2023, 03, 14, 0, 34, 22),
            updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
            anoOtorgamiento: 2010),
        MatriculaProfesional(
            idmatriculaprofesional: 2,
            numeroMatricula: 123457,
            tipoMatriculaProfesional: TipoMatriculaProfesional(
              idtipomatricula: 2,
              descripcion: "MP - Tucumán",
              createdAt: DateTime(2023, 03, 14, 0, 34, 22),
              updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
            ),
            universidad: Universidad(
                iduniversidad: 1, descripcion: "Universidad San Pablo - T"),
            createdAt: DateTime(2023, 03, 14, 0, 34, 22),
            updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
            anoOtorgamiento: 2013),
      ]),
  Profesional(
      idprofesional: 3,
      createdAt: DateTime(2023, 03, 14, 0, 34, 22),
      updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
      usuario: Usuario(
        idusuario: 3,
        correo: "juanperez@gmail.com",
        contrasena: "",
        dni: 34564234,
        nombre: "Juan",
        apellido: "Perez",
        fechaNacimiento: DateTime(1990, 04, 23),
        sexo: "Masculino",
        imagenPerfil:
            'https://res.cloudinary.com/healthsafeapp/image/upload/v1678944554/profesional_avatar_1_ioyjpm.png',
        imagenDniFrente: "",
        imagenDniDorso: "",
        rol: Rol(idrol: 1, descripcion: "Profesional"),
        createdAt: DateTime(2023, 03, 14, 0, 34, 22),
        updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
      ),
      consultorioPrincipal: "Sanatorio Modelo - Laprida 150",
      rangoPrecioTurno: "\$900 - \$2500",
      calificacion: 5.0,
      cantidadOpiniones: 56,
      especialidades: [
        EspecialidadProfesional(
            especialidad: Especialidad(
              idEspecialidad: 1,
              descripcion: "Médico General",
              createdAt: DateTime(2023, 03, 14, 0, 34, 22),
              updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
            ),
            anoOtorgamiento: 2010),
        EspecialidadProfesional(
            especialidad: Especialidad(
              idEspecialidad: 3,
              descripcion: "Gastroenterología",
              createdAt: DateTime(2023, 03, 14, 0, 34, 22),
              updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
            ),
            anoOtorgamiento: 2013)
      ],
      matriculasProfesionales: [
        MatriculaProfesional(
            idmatriculaprofesional: 5,
            numeroMatricula: 123459,
            tipoMatriculaProfesional: TipoMatriculaProfesional(
              idtipomatricula: 1,
              descripcion: "MN",
              createdAt: DateTime(2023, 03, 14, 0, 34, 22),
              updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
            ),
            universidad: Universidad(iduniversidad: 1, descripcion: "UNT"),
            createdAt: DateTime(2023, 03, 14, 0, 34, 22),
            updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
            anoOtorgamiento: 2010),
        MatriculaProfesional(
            idmatriculaprofesional: 5,
            numeroMatricula: 123480,
            tipoMatriculaProfesional: TipoMatriculaProfesional(
              idtipomatricula: 2,
              descripcion: "MP - Tucumán",
              createdAt: DateTime(2023, 03, 14, 0, 34, 22),
              updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
            ),
            universidad: Universidad(
                iduniversidad: 1, descripcion: "Universidad San Pablo - T"),
            createdAt: DateTime(2023, 03, 14, 0, 34, 22),
            updatedAt: DateTime(2023, 03, 14, 0, 34, 22),
            anoOtorgamiento: 2013),
      ]),
]);
