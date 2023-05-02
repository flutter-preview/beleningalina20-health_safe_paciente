class ExcludedPayment {
  ExcludedPayment({
    required this.id,
  });

  String id;

  factory ExcludedPayment.fromJson(Map<String, dynamic> json) =>
      ExcludedPayment(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
