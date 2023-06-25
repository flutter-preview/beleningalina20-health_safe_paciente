import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/services/database/models/direccion_entity.dart';
import 'package:health_safe_paciente/src/helpers/database_provider.dart';

class DireccionService {
  Future<void> crearDireccion(DireccionEntity direccion) async {
    final db = await DBProvider.db.database;
    await db.insert("direccion", direccion.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
