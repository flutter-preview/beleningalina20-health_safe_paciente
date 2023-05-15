import 'package:health_safe_paciente/src/helpers/utils/database_provider.dart';
import 'package:health_safe_paciente/src/models/server/database/database_models.dart';
import 'package:health_safe_paciente/src/services/database/database_services.dart';

class TurnoDatabaseService {
  Future<void> guardarTurno(TurnoEntity turno) async {
    try {
      final db = await DBProvider.db.database;

      await EspecialidadDatabaseService().crearEspecialidad(turno.especialidad);
      await ModalidadAtencionDatabaseService()
          .crearModalidadAtencion(turno.modalidadAtencion);

      if (turno.consultorio != null) {
        await ConsultorioDatabaseService().crearConsultorio(turno.consultorio!);
      }

      await UsuarioDatabaseService().crearUsuario(turno.profesional.usuario);
      await ProfesionalDatabaseService().crearProfesional(turno.profesional);
      await db.insert("turno", turno.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
