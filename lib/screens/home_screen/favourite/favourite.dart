import 'package:addidas_ecommerce_app/components/custom_text/custom_poppins_text.dart';
import 'package:addidas_ecommerce_app/models/sneaker_model.dart';
import 'package:addidas_ecommerce_app/providers/auth_provider.dart';
import 'package:addidas_ecommerce_app/utils/demo_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<SneakerModel> sneakers = DemoData.sneakers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
            child: Column(
          children: [
            const Row(
              children: [
                BackButton(),
                CustomPoppinsText(text: "Favorite Items")
              ],
            ),
            Divider(
              color: Colors.grey.shade700,
            ),
            Expanded(
              child: Consumer<AuthProvider>(builder: (context, value, child) {
                return value.favItems.isNotEmpty
                    ? ListView.builder(
                        itemCount: value.favItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                value.favItems[index].image))),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomPoppinsText(
                                        text: sneakers[index].title,
                                        fontSize: 18,
                                      ),
                                      Chip(
                                          label: Text(
                                              "LKR ${value.favItems[index].price}0"))
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        value.removeFromFav(
                                            value.favItems[index]);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                    : const Center(child: Text("No Favorite Items Found"));
              }),
            )
          ],
        )));
  }
}
