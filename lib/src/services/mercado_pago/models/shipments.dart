import 'package:health_safe_paciente/src/services/mercado_pago/models/address.dart';
import 'package:health_safe_paciente/src/services/mercado_pago/models/differential_pricing.dart';

class Shipments {
  Shipments({
    this.mode,
    this.localPickup,
    required this.dimensions,
    required this.defaultShippingMethod,
    required this.freeMethods,
    required this.cost,
    required this.freeShipping,
    required this.receiverAddress,
  });

  String? mode = "not_specified";
  bool? localPickup;
  String? dimensions;
  int? defaultShippingMethod;
  List<DifferentialPricing?>? freeMethods = [];
  int? cost;
  bool? freeShipping;
  Address receiverAddress;

  factory Shipments.fromJson(Map<String, dynamic> json) => Shipments(
        mode: json["mode"],
        localPickup: json["local_pickup"],
        dimensions: json["dimensions"],
        defaultShippingMethod: json["default_shipping_method"],
        freeMethods: (json["free_methods"] != null)
            ? List<DifferentialPricing>.from(json["free_methods"]!
                .map((x) => DifferentialPricing.fromJson(x)))
            : [],
        cost: json["cost"],
        freeShipping: json["free_shipping"],
        receiverAddress: Address.fromJson(json["receiver_address"]),
      );

  Map<String, dynamic> toJson() => {
        "mode": mode,
        "local_pickup": localPickup,
        "dimensions": dimensions,
        "default_shipping_method": defaultShippingMethod,
        // "free_methods": List<DifferentialPricing?>.from(
        //  freeMethods?.map((DifferentialPricing x) => x.toJson())),
        "cost": cost,
        "free_shipping": freeShipping,
        "receiver_address": receiverAddress.toJson(),
      };
}
