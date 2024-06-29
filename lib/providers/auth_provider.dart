import 'package:addidas_ecommerce_app/models/user_model.dart';
import 'package:addidas_ecommerce_app/providers/profile_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;
  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setUserModel(UserModel model, BuildContext context, String name) {
    _userModel = model;
    Provider.of<ProfileProvider>(context, listen: false).setUserName(name);
    notifyListeners();
  }
}
