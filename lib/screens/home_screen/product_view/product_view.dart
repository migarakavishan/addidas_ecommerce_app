import 'package:addidas_ecommerce_app/models/sneaker_model.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.model});
  final SneakerModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [const BackButton(), Image.network(model.image)],
      )),
    );
  }
}
