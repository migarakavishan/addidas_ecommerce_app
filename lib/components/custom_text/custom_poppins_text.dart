import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPoppinsText extends StatelessWidget {
  const CustomPoppinsText({
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    super.key,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}