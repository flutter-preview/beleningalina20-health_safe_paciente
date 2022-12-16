class Usuario {
  Usuario(
      {required this.id,
      required this.correo,
      this.contrasena,
      required this.rol,
      required this.nombre,
      required this.apellido});

  int id;
  String correo;
  String? contrasena;
  String rol;
  String nombre;
  String apellido;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
      id: json["id"],
      correo: json["correo"],
      contrasena: json["contrasena"],
      rol: json["rol"],
      nombre: json["nombre"],
      apellido: json["apellido"]);
}
