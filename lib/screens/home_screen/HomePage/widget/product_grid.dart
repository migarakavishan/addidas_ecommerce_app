import 'package:addidas_ecommerce_app/components/custom_text/custom_poppins_text.dart';
import 'package:addidas_ecommerce_app/controllers/product_controller.dart';
import 'package:addidas_ecommerce_app/models/sneaker_model.dart';
import 'package:addidas_ecommerce_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key, r});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductController().fetchProducts(context),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Has Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade500,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                );
              });
        }

        List<SneakerModel> sneakers = snapshot.data!;
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: sneakers.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(sneakers[index].image),
                    fit: BoxFit.cover),
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Consumer<AuthProvider>(builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(label: Text("LKR ${sneakers[index].price}0")),
                          GestureDetector(
                            onTap: () {
                              if (value.favID.contains(sneakers[index].id)) {
                                value.removeFromFav(sneakers[index]);
                              } else {
                                value.addToFav(sneakers[index]);
                              }
                            },
                            child: Icon(
                              value.favID.contains(sneakers[index].id)
                                  ? Icons.favorite
                                  : Icons.favorite_outline_rounded,
                              color: value.favID.contains(sneakers[index].id)
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Positioned(
                          bottom: 5,
                          child: CustomPoppinsText(
                            text: sneakers[index].title,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                );
              }),
            );
          },
        );
      },
    );
  }
}
