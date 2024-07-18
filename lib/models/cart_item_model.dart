import 'package:addidas_ecommerce_app/models/sneaker_model.dart';

class CartItemModel {
  SneakerModel model;
  int quantity;

  CartItemModel({required this.model, required this.quantity});

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
        model: SneakerModel.fromJson(json['model'] as Map<String, dynamic>),
        quantity: (json["quantity"] as num).toInt());
  }

  Map<String, dynamic> toJson() {
    return {"quantity": quantity, "model": model.toJson()};
  }
}
