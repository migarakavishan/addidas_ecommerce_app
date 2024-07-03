class SneakerModel {
  String id;
  String title;
  String description;
  String image;
  double price;

  SneakerModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price});

  factory SneakerModel.fromJson(Map<String, dynamic> json) {
    return SneakerModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        price: (json["price"] as num).toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "image": image,
      "price": price
    };
  }
}
