import 'package:flutter/material.dart';

import '../../components/custom_text/custom_poppins_text.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPoppinsText(
                text: "Adidas",
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              CustomPoppinsText(
                text: "Please fill your detail to access account",
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField1(
                label: "Email",
                icon: Icons.email,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField1(
                label: "Password",
                icon: Icons.password,
                isPassword: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField1 extends StatefulWidget {
  const CustomTextField1({
    required this.label,
    required this.icon,
    this.isPassword = false,
    super.key,
  });

  final String label;
  final IconData icon;
  final bool isPassword;

  @override
  State<CustomTextField1> createState() => _CustomTextField1State();
}

class _CustomTextField1State extends State<CustomTextField1> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
                      Icon(isObscure ? Icons.visibility_off : Icons.visibility))
              : null),
    );
  }
}
