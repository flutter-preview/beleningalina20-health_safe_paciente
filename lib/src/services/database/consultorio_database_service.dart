import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/helpers/utils/database_provider.dart';
import 'package:health_safe_paciente/src/models/server/database/database_models.dart';
import 'package:health_safe_paciente/src/services/database/database_services.dart';

class ConsultorioDatabaseService {
  Future<void> crearConsultorio(ConsultorioEntity consultorio) async {
    final db = await DBProvider.db.database;
    await LocalidadDatabaseService()
        .crearLocalidad(consultorio.direccion.localidad);
    await DireccionDatabaseService().crearDireccion(consultorio.direccion);
    await db.insert("consultorio", consultorio.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
