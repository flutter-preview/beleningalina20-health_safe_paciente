class DifferentialPricing {
  DifferentialPricing({required this.id});

  int id;

  factory DifferentialPricing.fromJson(Map<String, dynamic> json) =>
      DifferentialPricing(id: json["id"]);

  Map<String, dynamic> toJson() => {"id": id};
}
