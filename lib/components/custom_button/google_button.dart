import 'package:addidas_ecommerce_app/components/custom_text/custom_poppins_text.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton(
      {super.key,
      required this.size,
      required this.ontap,
      this.isSignIn = true});

  final Size size;
  final VoidCallback ontap;
  final bool isSignIn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: size.width * 0.7,
          height: 45,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/google.webp",
                width: 25,
                height: 25,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomPoppinsText(
                text: isSignIn ? "Sign in with Google" : "Sign Up with Google",
                fontSize: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
