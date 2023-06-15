class Address {
  Address({
    required this.zipCode,
    required this.streetName,
    required this.cityName,
    required this.stateName,
    required this.streetNumber,
    this.floor,
    this.apartment,
  });

  String zipCode;
  String streetName;
  String? cityName;
  String? stateName;
  int? streetNumber;
  String? floor;
  String? apartment;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        zipCode: json["zip_code"],
        streetName: json["street_name"],
        cityName: json["city_name"],
        stateName: json["state_name"],
        streetNumber: json["street_number"],
        floor: json["floor"],
        apartment: json["apartment"],
      );

  Map<String, dynamic> toJson() => {
        "zip_code": zipCode,
        "street_name": streetName,
        "city_name": cityName,
        "state_name": stateName,
        "street_number": streetNumber,
        "floor": floor,
        "apartment": apartment,
      };
}
