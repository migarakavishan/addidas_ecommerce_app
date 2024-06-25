import 'package:flutter/material.dart';

class CustomTextField1 extends StatefulWidget {
  const CustomTextField1({
    required this.label,
    required this.icon,
    this.isPassword = false,
    required this.controller,
    super.key,
  });

  final String label;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<CustomTextField1> createState() => _CustomTextField1State();
}

class _CustomTextField1State extends State<CustomTextField1> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: isObscure,
      decoration: InputDecoration(
          label: Text(widget.label),
          border: const OutlineInputBorder(),
          prefixIcon: Icon(
            widget.icon,
          ),
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off))
              : null),
    );
  }
}
