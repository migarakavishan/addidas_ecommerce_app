import 'package:addidas_ecommerce_app/screens/auth_screen/forgot_password.dart';
import 'package:addidas_ecommerce_app/screens/auth_screen/signup_page.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/homepage.dart';
import 'package:addidas_ecommerce_app/utils/custom_navigators.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/custom_button/custom_button1.dart';
import '../../components/custom_button/google_button.dart';
import '../../components/custom_text/custom_poppins_text.dart';
import '../../components/custom_text_field/custom_textfield1.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomPoppinsText(
                text: "Adidas",
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              const CustomPoppinsText(
                text: "Please fill your detail to access account",
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField1(
                label: "Email",
                icon: Icons.email,
                controller: emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField1(
                label: "Password",
                icon: Icons.password,
                isPassword: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (val) {},
                  ),
                  const CustomPoppinsText(
                    text: "Remember me",
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () {
                      CustomNavigators.goTo(context, const ForgotPassword());
                    },
                    child: CustomPoppinsText(
                      text: "Foget Password?",
                      fontSize: 14,
                      color: Colors.orange.shade800,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              CustomButton1(
                text: "Sign In",
                bgColor: Colors.orange.shade800,
                size: size,
                ontap: () {
                  CustomNavigators.goTo(context, const HomePage());
                },
              ),
              const SizedBox(
                height: 6,
              ),
              GoogleButton(ontap: () {}, size: size),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    CustomNavigators.goTo(context, const SignUpPage());
                  },
                  child: Text.rich(
                      TextSpan(text: "Don't have an account?", children: [
                    TextSpan(
                        text: "Sign Up",
                        style:
                            GoogleFonts.poppins(color: Colors.orange.shade800))
                  ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
