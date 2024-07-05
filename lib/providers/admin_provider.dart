import 'dart:io';

import 'package:addidas_ecommerce_app/controllers/product_controller.dart';
import 'package:addidas_ecommerce_app/controllers/stroage_controller.dart';
import 'package:addidas_ecommerce_app/models/sneaker_model.dart';
import 'package:addidas_ecommerce_app/utils/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AdminProvider extends ChangeNotifier {
  ProductController productController = ProductController();
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  final TextEditingController _priceController = TextEditingController();
  TextEditingController get priceController => _priceController;

  File? _imageFile;
  File? get imageFile => _imageFile;

  CollectionReference products =
      FirebaseFirestore.instance.collection("Products");

  List<SneakerModel> _allItems = [];
  List<SneakerModel> get allItems => _allItems;

  Future<void> pickImage(BuildContext context) async {
    _imageFile = await FileImagePicker().pickImage(context);
    notifyListeners();
  }

  Future<void> addProduct(BuildContext context) async {
    if (_imageFile != null &&
        _nameController.text.trim().isNotEmpty &&
        _descriptionController.text.trim().isNotEmpty &&
        _priceController.text.isNotEmpty) {
      String docId = products.doc().id;
      await StroageController()
          .uploadImage("Product Images", "$docId.jpg", _imageFile!)
          .then((value) async {
        if (value == "") {
          Logger().e("Failed");
        } else {
          SneakerModel model = SneakerModel(
              id: docId,
              title: _nameController.text,
              description: _descriptionController.text,
              image: value,
              price: double.parse(_priceController.text));
          await productController.addProduct(model, products, docId, context);
        }
      });
    } else {
      Logger().e("Please add product details");
    }
  }

  void clearForm() {
    _descriptionController.clear();
    _nameController.clear();
    _priceController.clear();
    _imageFile = null;
    notifyListeners();
  }

  void setAllProducts(List<SneakerModel> list) {
    _allItems = list;
    notifyListeners();
  }
}
