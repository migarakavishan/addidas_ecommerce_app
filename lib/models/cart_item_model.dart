import 'package:addidas_ecommerce_app/models/sneaker_model.dart';

class CartItemModel {
  SneakerModel model;
  int quantity;

  CartItemModel({required this.model, required this.quantity});
}
