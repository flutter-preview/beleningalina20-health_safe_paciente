import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/services/database/models/profesional_entity.dart';
import 'package:health_safe_paciente/src/helpers/database_provider.dart';

class ProfesionalService {
  Future<void> crearProfesional(ProfesionalEntity profesional) async {
    final db = await DBProvider.db.database;
    await db.insert("profesional", profesional.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<ProfesionalEntity>> obtenerProfesionales() async {
    final db = await DBProvider.db.database;

    List<Map<String, Object?>> response = await db.rawQuery('''
        SELECT * 
        FROM profesional 
        INNER JOIN usuario ON profesional.idUsuario = usuario.id
      ''');

    List<ProfesionalEntity> profesionales =
        response.map((resp) => ProfesionalEntity.fromJson(resp)).toList();
    return profesionales;
  }
}
