import 'dart:io';

import 'package:addidas_ecommerce_app/controllers/auth_controller.dart';
import 'package:addidas_ecommerce_app/providers/auth_provider.dart';
import 'package:addidas_ecommerce_app/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ProfileProvider extends ChangeNotifier {
  AuthController authController = AuthController();
  FileImagePicker picker = FileImagePicker();
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  File? _pickedImage;
  File? get pickedImage => _pickedImage;

  void setUserName(String name) {
    _nameController.text = name;
    notifyListeners();
  }

  Future<void> updateUserData(BuildContext context) async {
    String uid = Provider.of<AuthProvider>(context, listen: false).user!.uid;
    if (_nameController.text.trim().isNotEmpty) {
      authController.updateUser(uid, _nameController.text);
    } else {
      Logger().e("Please enter your name");
    }
  }

  Future<void> pickProfileImage() async {
    _pickedImage = await picker.pickImage();
  }
}
