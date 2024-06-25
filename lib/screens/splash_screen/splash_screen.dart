import 'package:addidas_ecommerce_app/screens/auth_screen/signin_page.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/HomePage/homepage.dart';
import 'package:addidas_ecommerce_app/utils/custom_navigators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            Logger().e('User is currently signed out!');
            CustomNavigators.goTo(context, const SignInPage());
          } else {
            Logger().i('User is signed in!');
            Logger().f(user);
            CustomNavigators.goTo(context, const HomePage());
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash_img.png"),
            const CupertinoActivityIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
