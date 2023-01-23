class LoginRequest {
  LoginRequest({required this.correo, required this.contrasena});

  String correo;
  String contrasena;

  Map<String, String> toJson() => {
        'correo': correo.trim(),
        'contrasena': contrasena.trim(),
      };

  @override
  String toString() => '$correo - $contrasena';
}
