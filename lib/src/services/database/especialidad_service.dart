import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/services/database/models/especialidad_entity.dart';
import 'package:health_safe_paciente/src/helpers/database_provider.dart';

class EspecialidadService {
  Future<void> crearEspecialidad(EspecialidadEntity especialidad) async {
    final db = await DBProvider.db.database;
    await db.insert("especialidad", especialidad.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
