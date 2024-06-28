import 'package:addidas_ecommerce_app/components/custom_text/custom_poppins_text.dart';
import 'package:addidas_ecommerce_app/models/sneaker_model.dart';
import 'package:addidas_ecommerce_app/providers/auth_provider.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/HomePage/widget/action_bar.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/HomePage/widget/product_grid.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/HomePage/widget/slider.dart';
import 'package:addidas_ecommerce_app/screens/home_screen/HomePage/widget/top_categories.dart';
import 'package:addidas_ecommerce_app/utils/demo_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SneakerModel> sneakers = DemoData.sneakers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomActionBar(),
              const SizedBox(
                height: 8,
              ),
              CustomPoppinsText(
                text:
                    "Hello ${Provider.of<AuthProvider>(context).userModel!.name}",
                fontWeight: FontWeight.w500,
              ),
              CustomPoppinsText(
                text: "Lets start shopping!",
                fontSize: 18,
                color: Colors.grey.shade500,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomSlider(),
              const SizedBox(
                height: 10,
              ),
              TopCategories(),
              ProductGrid(sneakers: sneakers)
            ],
          ),
        ),
      )),
    );
  }
}
