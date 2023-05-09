import 'package:health_safe_paciente/src/database/database_provider.dart';
import 'package:health_safe_paciente/src/database/local_service.dart';
import 'package:health_safe_paciente/src/database/models/local.dart';
import 'package:sqflite/sqflite.dart';

class ConsultorioLocalService {
  Future<void> crearConsultorio(Consultorio consultorio) async {
    final db = await DBProvider.db.database;
    await LocalidadLocalService()
        .crearLocalidad(consultorio.direccion.localidad);
    await DireccionLocalService().crearDireccion(consultorio.direccion);
    await db.insert("consultorio", consultorio.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
