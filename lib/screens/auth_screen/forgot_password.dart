import 'package:addidas_ecommerce_app/components/custom_button/custom_button1.dart';
import 'package:addidas_ecommerce_app/components/custom_text/custom_poppins_text.dart';
import 'package:addidas_ecommerce_app/components/custom_text_field/custom_textfield1.dart';
import 'package:addidas_ecommerce_app/providers/siginin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<SigininProvider>(builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    BackButton(),
                    CustomPoppinsText(
                      text: "Reset Your Password",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomPoppinsText(
                  text: "Insert your email and get password reset email",
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField1(
                    label: "Email",
                    icon: Icons.email,
                    controller: value.resetEmail),
                const SizedBox(
                  height: 10,
                ),
                CustomButton1(
                  text: "Send Reset Email",
                  bgColor: Colors.orange.shade800,
                  size: size,
                  ontap: () {
                    value.sendResetEmail();
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
