import 'package:addidas_ecommerce_app/components/custom_button/custom_button1.dart';
import 'package:addidas_ecommerce_app/models/sneaker_model.dart';
import 'package:addidas_ecommerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.model});
  final SneakerModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CartProvider>(builder: (context, value, child) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 200,
                    child: Stack(
                      children: [
                        const SafeArea(child: BackButton()),
                        Align(
                          alignment: Alignment.center,
                          child: Image.network(
                            model.image,
                            fit: BoxFit.cover,
                            width: size.width * 0.7,
                            height: size.width * 0.7,
                          ),
                        ),
                        Positioned(
                            bottom: 5,
                            right: 5,
                            child: Container(
                              width: 105,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.amber.shade800,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  "LKR ${model.price}/=",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Text(
                    model.title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    model.description,
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Quantity",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.amber.shade900,
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                value.decrementQuantity();
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(0.3),
                                radius: 18,
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              value.getQuantity(model),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            GestureDetector(
                              onTap: () {
                                value.increseQuantity();
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(0.3),
                                radius: 18,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Positioned(
                bottom: 5,
                left: 5,
                right: 5,
                child: value.cartItems
                        .any((element) => element.model.id == model.id)
                    ? CustomButton1(
                        text: "Remove from Cart",
                        bgColor: Colors.red.shade800,
                        size: size,
                        ontap: () {
                          value.addToCart(model);
                        },
                      )
                    : CustomButton1(
                        text: "Add to Cart",
                        bgColor: Colors.amber.shade800,
                        size: size,
                        ontap: () {
                          value.addToCart(model);
                        },
                      ),
              )
            ],
          );
        }),
      ),
    );
  }
}
