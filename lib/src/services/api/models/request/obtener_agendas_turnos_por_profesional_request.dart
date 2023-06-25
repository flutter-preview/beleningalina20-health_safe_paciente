class ObtenerAgendaTurnosPorProfesionalRequest {
  int idProfesional;

  ObtenerAgendaTurnosPorProfesionalRequest({required this.idProfesional});

  String request() => idProfesional.toString();
}
