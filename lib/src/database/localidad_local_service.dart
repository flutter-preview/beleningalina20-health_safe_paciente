import 'package:health_safe_paciente/src/database/database_provider.dart';
import 'package:health_safe_paciente/src/database/models/local.dart';
import 'package:sqflite/sqflite.dart';

class LocalidadLocalService {
  Future<void> crearLocalidad(Localidad localidad) async {
    final db = await DBProvider.db.database;
    await db.insert("localidad", localidad.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
