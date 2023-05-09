import 'package:health_safe_paciente/src/database/database_provider.dart';
import 'package:health_safe_paciente/src/database/models/local.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioLocalService {
  Future<void> crearUsuario(Usuario usuario) async {
    final db = await DBProvider.db.database;

    await db.insert("usuario", usuario.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
