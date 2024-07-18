import 'package:addidas_ecommerce_app/controllers/order_controller.dart';
import 'package:addidas_ecommerce_app/models/cart_item_model.dart';
import 'package:addidas_ecommerce_app/models/order_model.dart';
import 'package:addidas_ecommerce_app/models/sneaker_model.dart';
import 'package:addidas_ecommerce_app/models/user_model.dart';
import 'package:addidas_ecommerce_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  int _quantity = 1;
  int get quantity => _quantity;

  final List<CartItemModel> _cartItems = [];
  List<CartItemModel> get cartItems => _cartItems;
  OrderController orderController = OrderController();

  void increseQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity != 1) {
      _quantity--;
      notifyListeners();
    }
  }

  void addToCart(SneakerModel model) {
    if (_cartItems.any((element) => element.model.id == model.id)) {
      _cartItems.removeWhere((element) => element.model.id == model.id);
      Logger().e(_cartItems.length);
      notifyListeners();
    } else {
      _cartItems.add(CartItemModel(model: model, quantity: _quantity));
      Logger().f(_cartItems.length);
      notifyListeners();
    }
  }

  void increaseCartItemQuantity(int index) {
    _cartItems[index].quantity++;
    notifyListeners();
  }

  void decrementCartItemQuantity(int index) {
    if (_cartItems[index].quantity != 1) {
      _cartItems[index].quantity--;
      notifyListeners();
    }
  }

  String getQuantity(SneakerModel model) {
    int q = 1;
    if (_cartItems.any((element) => element.model.id == model.id)) {
      q = _cartItems[
              _cartItems.indexWhere((element) => element.model.id == model.id)]
          .quantity;
    } else {
      q = _quantity;
    }

    return "$q";
  }

  String calculateTotal() {
    double total = 0;
    for (var element in _cartItems) {
      total += element.model.price * element.quantity;
    }
    return "$total";
  }

  Future<void> saveOrders(BuildContext context) async {
    UserModel user =
        Provider.of<AuthProvider>(context, listen: false).userModel!;
    OrderModel model = OrderModel(
        items: _cartItems,
        orderID: "",
        totalAmount: double.parse(calculateTotal()),
        user: user);
    orderController.saveOrderDetails(model);
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
