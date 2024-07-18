import 'package:addidas_ecommerce_app/models/cart_item_model.dart';
import 'package:addidas_ecommerce_app/models/user_model.dart';

class OrderModel {
  List<CartItemModel> items;
  UserModel user;
  String orderID;
  double totalAmount;

  OrderModel(
      {required this.items,
      required this.orderID,
      required this.totalAmount,
      required this.user});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<CartItemModel> cartItems = (json['items'] as List<dynamic>)
        .map((e) => CartItemModel.fromJson(e))
        .toList();
    return OrderModel(
        items: cartItems,
        orderID: json['orderID'],
        totalAmount: (json['totalAmount'] as num).toDouble(),
        user: UserModel.fromJson(json['user'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> itemsMapList =
        items.map((e) => e.toJson()).toList();
    return {
      "items": itemsMapList,
      "user": user.toJson(),
      "orderID": orderID,
      "totalAmount": totalAmount
    };
  }
}
