import 'package:health_safe_paciente/src/database/database_provider.dart';
import 'package:health_safe_paciente/src/database/models/local.dart';
import 'package:sqflite/sqflite.dart';

class EspecialidadLocalService {
  Future<void> crearEspecialidad(Especialidad especialidad) async {
    final db = await DBProvider.db.database;
    await db.insert("especialidad", especialidad.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
