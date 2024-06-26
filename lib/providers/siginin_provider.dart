import 'package:addidas_ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class SigininProvider extends ChangeNotifier {
  AuthController authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _resetEmail = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get resetEmail => _resetEmail;

  Future<void> startSignIn() async {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      Logger().e("Invalid data");
    } else {
      bool isSuccess = await authController.signInWithPassword(
          email: _emailController.text, password: _passwordController.text);
      if (isSuccess) {
        clearTextField();
      }
    }
  }

  Future<void> sendResetEmail() async {
    if (_resetEmail.text.trim().isEmpty) {
      Logger().e("Please enter your email");
    } else {
      authController.sendpasswordRestEmail(_resetEmail.text).then(
        (value) {
          Logger().f("Check your Emails");
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
