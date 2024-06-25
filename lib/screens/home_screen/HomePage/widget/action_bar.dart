import 'package:addidas_ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {
  const CustomActionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.orange,
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        const CircleAvatar(
          backgroundColor: Colors.orange,
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            AuthController().signOutUser();
          },
          child: const CircleAvatar(
            backgroundColor: Colors.orange,
            child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
