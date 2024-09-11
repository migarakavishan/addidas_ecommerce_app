import 'dart:io';

import 'package:addidas_ecommerce_app/controllers/slider_controller.dart';
import 'package:addidas_ecommerce_app/controllers/stroage_controller.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/HomePage/homepage.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/cart/cart_screen.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/favourite/favourite.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/profile/profile_screen.dart';
import 'package:addidas_ecommerce_app/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MainScreenProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _screens = [
    const HomePage(),
    const Favourite(),
    const CartScreen(),
    const ProfileScreen()
  ];

  List<String> _sliderImages = [];
  List<String> get sliderImages => _sliderImages;
  File? _currentPickImage;
  File? get currentPickImage => _currentPickImage;

  Widget get screen => _screens[_currentIndex];
  FileImagePicker picker = FileImagePicker();
  StroageController stroage = StroageController();

  void setIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }

  void updateSliderImages(List<String> imgList) {
    _sliderImages = imgList;
    notifyListeners();
  }

  Future<void> pickSliderImage(BuildContext context) async {
    _currentPickImage = await picker.pickImage(context);
    notifyListeners();
  }

  Future<void> uploadImage() async {
    if (_currentPickImage == null) {
      Logger().e("Please pick image");
    } else {
      try {
        await stroage
            .uploadImage("Home Slider Images",
                "${_sliderImages.length + 1}.jpg", _currentPickImage!)
            .then((value) {
          _sliderImages.add(value);
          SliderController().updateSliderImage(_sliderImages);
        });
      } catch (e) {
        Logger().e(e);
      }
    }
  }
}
