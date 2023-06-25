import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';

Map<String, dynamic> apiResponseMapper(http.Response response) {
  Map<String, dynamic> responseJson = jsonDecode(response.body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    return responseJson;
  } else {
    throw ApiException.fromJson(responseJson);
  }
}
