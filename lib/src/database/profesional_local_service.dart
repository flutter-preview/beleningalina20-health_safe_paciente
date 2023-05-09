import 'package:health_safe_paciente/src/database/database_provider.dart';
import 'package:health_safe_paciente/src/database/models/local.dart';
import 'package:sqflite/sqflite.dart';

class ProfesionalLocalService {
  Future<void> crearProfesional(Profesional profesional) async {
    final db = await DBProvider.db.database;
    await db.insert("profesional", profesional.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<Turno>> obtenerProfesionales() async {
    final db = await DBProvider.db.database;

    List<Map<String, Object?>> response = await db.rawQuery('''
        SELECT * 
        FROM profesional 
        INNER JOIN usuario ON profesional.idUsuario = usuario.id
      ''');
    return [];
  }
}
