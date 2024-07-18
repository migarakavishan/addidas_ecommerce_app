import 'package:addidas_ecommerce_app/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class OrderController {
  CollectionReference orders = FirebaseFirestore.instance.collection("Orders");

  Future<void> saveOrderDetails(OrderModel model) async {
    try {
      String orderID = orders.doc().id;
      model.orderID = orderID;
      Map<String, dynamic> orderData = model.toJson();
      await orders.doc(orderID).set(orderData).then((value) {
        Logger().f("Order Saved");
      });
    } catch (e) {
      Logger().e(e);
    }
  }
}
