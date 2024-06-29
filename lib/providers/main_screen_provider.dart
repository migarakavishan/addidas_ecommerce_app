import 'package:addidas_ecommerce_app/screens/home_screen/HomePage/homepage.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/cart/cart_screen.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/favourite/favourite.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreenProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _screens = [
    const HomePage(),
    const Favourite(),
    const CartScreen(),
    const ProfileScreen()
  ];

  Widget get screen => _screens[_currentIndex];

  void setIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }
}
