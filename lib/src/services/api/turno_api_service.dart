import 'dart:io';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/database/database_services.dart';
import 'package:health_safe_paciente/src/services/api/constants/base_endpoints.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_response_mapper.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';

class TurnoApiService {
  Future crearTurno(Turno turno) async {
    return await _crearTurnoService(turno).then((value) {
      // TODO enviar la notificacion al profesional
      TurnoDatabaseService().guardarTurno(TurnoEntity(
          id: turno.id ?? 0,
          fecha: turno.fecha,
          fechaSolicita: turno.fechaSolicita,
          horaInicio: turno.horaInicio,
          horaFin: turno.horaFin,
          precio: turno.precio!,
          idPago: turno.idPago!,
          idAgendaTurnos: turno.agendaTurnos!.id,
          especialidad: EspecialidadEntity(
              id: turno.especialidad.id,
              descripcion: turno.especialidad.descripcion),
          modalidadAtencion: ModalidadAtencionEntity(
              id: turno.agendaTurnos!.modalidadAtencion.id,
              descripcion: turno.agendaTurnos!.modalidadAtencion.descripcion),
          profesional: ProfesionalEntity(
              id: turno.agendaTurnos!.profesional!.id,
              usuario: UsuarioEntity(
                  id: turno.agendaTurnos!.profesional!.usuario.id,
                  correo: turno.agendaTurnos!.profesional!.usuario.correo,
                  nombre: turno.agendaTurnos!.profesional!.usuario.nombre,
                  apellido: turno.agendaTurnos!.profesional!.usuario.apellido,
                  urlImagenPerfil:
                      turno.agendaTurnos!.profesional!.usuario.imagenPerfil,
                  sexo: turno.agendaTurnos!.profesional!.usuario.sexo,
                  rol: RolEntity(
                    id: turno.agendaTurnos!.profesional!.usuario.rol.id,
                    descripcion: turno
                        .agendaTurnos!.profesional!.usuario.rol.descripcion,
                  )))));
      return null;
    }).onError((Exception error, stackTrace) => throw error);
  }

  Future<List<Turno>> obtenerTurnos(int idPaciente) async {
    return await _obtenerTurnosService(idPaciente).then((value) {
      return value.turnos;
    }).onError((Exception error, stackTrace) => throw error);
  }

  Future<CrearTurnoResponse> _crearTurnoService(Turno turno) async {
    try {
      final resp = await http
          .post(Uri.parse(BaseEndpoints.crearTurno), body: turno.toJson())
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return CrearTurnoResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }

  Future<ObtenerTurnosResponse> _obtenerTurnosService(int idPaciente) async {
    try {
      final resp = await http
          .get(Uri.parse(BaseEndpoints.obtenerTurnosPorPaciente))
          .timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      Map<String, dynamic> response = apiResponseMapper(resp);

      return ObtenerTurnosResponse.fromJson(response);
    } on SocketException {
      throw ApiException(message: 'Falló la comunicación con el servidor');
    } catch (e) {
      rethrow;
    }
  }
}
