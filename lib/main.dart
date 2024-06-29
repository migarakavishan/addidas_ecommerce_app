import 'package:addidas_ecommerce_app/firebase_options.dart';
import 'package:addidas_ecommerce_app/providers/auth_provider.dart';
import 'package:addidas_ecommerce_app/providers/main_screen_provider.dart';
import 'package:addidas_ecommerce_app/providers/profile_provider.dart';
import 'package:addidas_ecommerce_app/providers/siginin_provider.dart';
import 'package:addidas_ecommerce_app/providers/signup_provider.dart';
import 'package:addidas_ecommerce_app/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SignupProvider()),
      ChangeNotifierProvider(create: (context) => SigininProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => MainScreenProvider()),
      ChangeNotifierProvider(create: (context) => ProfileProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
