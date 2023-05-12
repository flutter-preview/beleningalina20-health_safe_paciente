import 'package:health_safe_paciente/src/database/database_provider.dart';
import 'package:health_safe_paciente/src/database/local_service.dart';
import 'package:health_safe_paciente/src/database/models/local.dart';

class TurnoLocalService {
  Future<void> guardarTurno(Turno turno) async {
    try {
      final db = await DBProvider.db.database;

      await EspecialidadLocalService().crearEspecialidad(turno.especialidad);
      await ModalidadAtencionLocalService()
          .crearModalidadAtencion(turno.modalidadAtencion);

      if (turno.consultorio != null) {
        await ConsultorioLocalService().crearConsultorio(turno.consultorio!);
      }

      await UsuarioLocalService().crearUsuario(turno.profesional.usuario);
      await ProfesionalLocalService().crearProfesional(turno.profesional);
      await db.insert("turno", turno.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
