import 'package:health_safe_paciente/src/pages/models/mercado_pago/payments.dart';

class Payer {
  Payer(
      {required this.name,
      required this.surname,
      required this.email,
      this.phone,
      this.identification,
      this.address,
      this.dateCreated});

  String name;
  String surname;
  String email;
  Phone? phone;
  Identification? identification;
  Address? address;
  String? dateCreated;

  factory Payer.fromJson(Map<String, dynamic> json) => Payer(
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        phone: Phone.fromJson(json["phone"]),
        identification: Identification.fromJson(json["identification"]),
        address: Address.fromJson(json["address"]),
        dateCreated: json["date_created"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "email": email,
        "phone": phone?.toJson(),
        "identification": identification?.toJson(),
        "address": address?.toJson(),
        "date_created": dateCreated,
      };
}
