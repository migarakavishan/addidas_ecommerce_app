import 'package:addidas_ecommerce_app/providers/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button/custom_button1.dart';
import '../../components/custom_button/google_button.dart';
import '../../components/custom_text/custom_poppins_text.dart';
import '../../components/custom_text_field/custom_textfield1.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<SignupProvider>(builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomPoppinsText(
                text: "Adidas",
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              const CustomPoppinsText(
                text: "Create New Account With Your Email & Password",
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField1(
                label: "Email",
                icon: Icons.email,
                controller: value.emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField1(
                label: "Password",
                icon: Icons.password,
                isPassword: true,
                controller: value.passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField1(
                label: "Confirm Password",
                icon: Icons.password,
                isPassword: true,
                controller: value.confirmPasswordController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton1(
                text: "Create Account",
                bgColor: Colors.orange.shade800,
                size: size,
                ontap: () {
                  value.startSignUp();
                },
              ),
              const SizedBox(
                height: 6,
              ),
              GoogleButton(
                ontap: () {},
                size: size,
                isSignIn: false,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text.rich(
                      TextSpan(text: "Already have an account?", children: [
                    TextSpan(
                        text: "Sign In",
                        style:
                            GoogleFonts.poppins(color: Colors.orange.shade800))
                  ])),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
