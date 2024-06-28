import 'package:addidas_ecommerce_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;
  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setUserModel(UserModel model) {
    _userModel = model;
    notifyListeners();
  }
}
