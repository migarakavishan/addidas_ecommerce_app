import 'package:addidas_ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class SigininProvider extends ChangeNotifier {
  AuthController authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  Future<void> startSignIn() async {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      Logger().e("Invalid data");
    } else {
      authController
          .signInWithPassword(
              email: _emailController.text, password: _passwordController.text)
          .then(
        (value) {
          clearTextField();
        },
      );
    }
  }

  void clearTextField() {
    _emailController.clear();
    _passwordController.clear();
    notifyListeners();
  }
}
