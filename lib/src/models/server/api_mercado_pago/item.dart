class Item {
  Item({
    this.id,
    required this.title,
    required this.quantity,
    this.currencyId = "ARS",
    required this.unitPrice,
    this.description,
    this.pictureUrl,
    this.categoryId,
  });

  String? id;
  String title;
  int quantity;
  String? currencyId;
  double unitPrice;
  String? description;
  String? pictureUrl;
  String? categoryId;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        title: json["title"],
        quantity: json["quantity"],
        currencyId: json["currency_id"],
        unitPrice: json["unit_price"] / 1.0,
        description: json["description"],
        pictureUrl: json["picture_url"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "quantity": quantity,
        "currency_id": currencyId,
        "unit_price": unitPrice,
        "description": description,
        "picture_url": pictureUrl,
        "category_id": categoryId,
      };
}
