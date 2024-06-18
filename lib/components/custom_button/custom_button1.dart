import 'package:flutter/material.dart';

import '../custom_text/custom_poppins_text.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.size,
      required this.ontap});

  final Size size;
  final String text;
  final Color bgColor;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: size.width * 0.7,
          height: 45,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: CustomPoppinsText(
              text: text,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
