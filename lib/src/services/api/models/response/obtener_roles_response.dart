import 'package:health_safe_paciente/src/services/api/models/models.dart';

class ObtenerRolesResponse {
  String? msg;
  List<Rol> roles;

  ObtenerRolesResponse({this.msg, required this.roles});

  factory ObtenerRolesResponse.fromJson(Map<String, dynamic> json) =>
      ObtenerRolesResponse(
          msg: json["msg"],
          roles: List<Rol>.from(json["roles"].map((x) => Rol.fromJson(x))));
}
