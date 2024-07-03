import 'package:addidas_ecommerce_app/components/custom_button/custom_button1.dart';
import 'package:addidas_ecommerce_app/components/custom_text_field/custom_textfield1.dart';
import 'package:addidas_ecommerce_app/providers/admin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
      ),
      body: SafeArea(child: Consumer<AdminProvider>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Divider(),
                const CircleAvatar(
                  radius: 100,
                  child: Icon(
                    Icons.add,
                    size: 50,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField1(
                    label: "Product Name",
                    icon: Icons.production_quantity_limits_outlined,
                    controller: value.nameController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField1(
                    label: "Description",
                    icon: Icons.production_quantity_limits_outlined,
                    controller: value.descriptionController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField1(
                    label: "Price",
                    icon: Icons.production_quantity_limits_outlined,
                    controller: value.descriptionController,
                    keyboardType: TextInputType.number),
                const SizedBox(
                  height: 10,
                ),
                CustomButton1(
                  text: "Add Product",
                  bgColor: Colors.orange.shade800,
                  size: MediaQuery.sizeOf(context),
                  ontap: () {},
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
