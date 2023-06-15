class Phone {
  Phone({
    required this.areaCode,
    required this.number,
  });

  String areaCode;
  String number;

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        areaCode: json["area_code"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "area_code": areaCode,
        "number": number,
      };
}
