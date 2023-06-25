class ApiException implements Exception {
  final String? message;

  ApiException({this.message});

  factory ApiException.fromJson(Map<String, dynamic> json) =>
      ApiException(message: json["msg"]);

  @override
  String toString() {
    return message ?? 'No message';
  }
}
