import 'package:addidas_ecommerce_app/models/sneaker_model.dart';
import 'package:addidas_ecommerce_app/providers/admin_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ProductController {
  CollectionReference products =
      FirebaseFirestore.instance.collection("Products");
  Future<void> addProduct(SneakerModel model, CollectionReference products,
      String docId, BuildContext context) async {
    products.doc(docId).set(model.toJson()).then((value) {
      Logger().e("Product added");
      Provider.of<AdminProvider>(context, listen: false).clearForm();
    });
  }

  Future<List<SneakerModel>> fetchProducts() async {
    QuerySnapshot snapshot = await products.get();
    if (snapshot.docs.isEmpty) {
      Logger().e("Cant fetch data");
      return [];
    } else {
      List<SneakerModel> sneakers = [];
      for (var element in snapshot.docs) {
        SneakerModel sneaker =
            SneakerModel.fromJson(element.data() as Map<String, dynamic>);
        sneakers.add(sneaker);
      }
      return sneakers;
    }
  }
}
