import 'dart:io';

import 'package:addidas_ecommerce_app/controllers/auth_controller.dart';
import 'package:addidas_ecommerce_app/controllers/stroage_controller.dart';
import 'package:addidas_ecommerce_app/providers/auth_provider.dart';
import 'package:addidas_ecommerce_app/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ProfileProvider extends ChangeNotifier {
  AuthController authController = AuthController();
  FileImagePicker picker = FileImagePicker();
  StroageController storage = StroageController();
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  File? _pickedImage;
  File? get pickedImage => _pickedImage;

  void setUserName(String name) {
    _nameController.text = name;
    notifyListeners();
  }

  Future<void> updateUserData(BuildContext context) async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    if (_pickedImage != null) {
      String url = await storage.uploadImage(
          "User Images", "${auth.user!.uid}.jpg", _pickedImage!);
      Logger().f(url);
      if (url != "") {
        auth.updateImage(url);
      }
    }

    if (_nameController.text.trim().isNotEmpty) {
      Map<String, dynamic> data = {
        "name": _nameController.text,
        "image": auth.userModel!.image
      };
      authController.updateUser(data, auth.user!.uid);
    } else {
      Logger().e("Please enter your name");
    }
  }

  Future<void> pickProfileImage() async {
    _pickedImage = await picker.pickImage();
    notifyListeners();
  }
}
