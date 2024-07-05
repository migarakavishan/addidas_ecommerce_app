import 'package:addidas_ecommerce_app/controllers/auth_controller.dart';
import 'package:addidas_ecommerce_app/models/sneaker_model.dart';
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
  List<String> _favID = [];
  List<String> get favID => _favID;
  AuthController authController = AuthController();
  List<SneakerModel> _favItems = [];
  List<SneakerModel> get favItems => _favItems;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setUserModel(UserModel model, BuildContext context, String name) {
    _userModel = model;
    _favID = model.favorite;
    Provider.of<ProfileProvider>(context, listen: false).setUserName(name);
    notifyListeners();
  }

  void updateImage(String url) {
    _userModel!.image = url;
    notifyListeners();
  }

  void addToFav(SneakerModel model) {
    _favID.add(model.id);
    _favItems.add(model);
    authController.updateFavorite(user!.uid, _favID);
    notifyListeners();
  }

  void removeFromFav(SneakerModel model) {
    _favID.remove(model.id);
    _favItems.remove(model);
    authController.updateFavorite(user!.uid, _favID);
    notifyListeners();
  }

  void filterFavoriteItems(List<SneakerModel> sneakers) {
    List<SneakerModel> favSneakers = [];
    for (var item in sneakers) {
      if (_favID.contains(item.id) && !_favItems.contains(item)) {
        favSneakers.add(item);
      }
    }
    _favItems = favSneakers;
    notifyListeners();
  }
}
