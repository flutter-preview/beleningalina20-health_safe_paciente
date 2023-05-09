import 'package:flutter/cupertino.dart';
import 'package:health_safe_paciente/src/services/utils/api_response_mapper.dart';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/utils/environments.dart';
import 'package:health_safe_paciente/src/services/utils/local_storage_manager.dart';

class ChatService with ChangeNotifier {
  Future<List<Mensaje>> obtenerMensajes(int idUsuarioProfesional) async {
    final resp = await http.get(
        Uri.parse('${Environments.apiUrl}/mensajes/$idUsuarioProfesional'),
        headers: {
          'Content-Type': 'application/json',
          'x-token': await LocalStorage.localStorage.getToken() ?? ''
        });

    final response = apiResponseMapper(resp);
    return ObtenerMensajesResponse.fromJson(response).mensajes;
  }
}
