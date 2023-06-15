import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/helpers/utils/database_provider.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class DireccionDatabaseService {
  Future<void> crearDireccion(DireccionEntity direccion) async {
    final db = await DBProvider.db.database;
    await db.insert("direccion", direccion.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
