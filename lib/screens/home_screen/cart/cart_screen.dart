import 'package:addidas_ecommerce_app/components/custom_button/custom_button1.dart';
import 'package:addidas_ecommerce_app/components/custom_text/custom_poppins_text.dart';
import 'package:addidas_ecommerce_app/models/sneaker_model.dart';
import 'package:addidas_ecommerce_app/utils/demo_data.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<SneakerModel> sneakers = DemoData.sneakers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                children: [
                  BackButton(),
                  Spacer(),
                  CustomPoppinsText(
                    text: "My Cart",
                    fontWeight: FontWeight.w500,
                  ),
                  Spacer()
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: DemoData.sneakers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFEBEEF0)),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(sneakers[index].image))),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomPoppinsText(
                                text: sneakers[index].title,
                                fontSize: 18,
                              ),
                              Chip(label: Text("LKR ${sneakers[index].price}0"))
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEBEEF0),
                              border: Border.all(color: Colors.orange.shade900),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: Colors.orange.shade900,
                                ),
                                const CustomPoppinsText(
                                  text: "1",
                                  fontSize: 18,
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.orange.shade900,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomPoppinsText(
                            text: "Total",
                            color: Colors.white,
                          ),
                          CustomPoppinsText(
                            text: "LKR 12500/=",
                            color: Colors.orange.shade500,
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton1(
                        text: "Buy Now",
                        bgColor: Colors.orange,
                        size: MediaQuery.sizeOf(context),
                        ontap: () {},
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
