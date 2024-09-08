import 'package:addidas_ecommerce_app/models/order_model.dart';
import 'package:addidas_ecommerce_app/providers/auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

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

  Future<List<OrderModel>> fetchMyOrders(BuildContext context) async {
    String uid = Provider.of<AuthProvider>(context, listen: false).user!.uid;
    List<OrderModel> orderList = [];
    QuerySnapshot snapshot =
        await orders.where("user.uid", isEqualTo: uid).get();

    for (var order in snapshot.docs) {
      OrderModel myOrder =
          OrderModel.fromJson(order.data() as Map<String, dynamic>);
      orderList.add(myOrder);
    }
    return orderList;
  }

  Future<void> cancelOrder(String id) async {
    await orders.doc(id).delete().then((value) {
      Logger().f("Order Cancelled - $id");
    });
  }
}
