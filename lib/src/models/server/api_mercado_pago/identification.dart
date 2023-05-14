class Identification {
  Identification({
    required this.type,
    required this.number,
  });

  String type;
  String number;

  factory Identification.fromJson(Map<String, dynamic> json) => Identification(
        type: json["type"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "number": number,
      };
}
