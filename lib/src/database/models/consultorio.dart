import 'package:health_safe_paciente/src/database/models/local.dart';

class Consultorio {
  Consultorio({required this.id, this.descripcion, required this.direccion});

  int id;
  String? descripcion;
  Direccion direccion;

  Map<String, String> toJson() => {
        'id': id.toString(),
        'descripcion': descripcion.toString(),
        'idDireccion': direccion.id.toString()
      };
}
