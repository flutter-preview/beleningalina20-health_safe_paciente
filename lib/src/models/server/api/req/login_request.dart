class LoginRequest {
  LoginRequest({required this.correo, required this.contrasena});

  String correo;
  String contrasena;

  Map<String, dynamic> toJson() => {'correo': correo, 'contrasena': contrasena};
}
