import 'package:addidas_ecommerce_app/components/custom_text/custom_poppins_text.dart';
import 'package:addidas_ecommerce_app/models/sneaker_model.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.sneakers,
  });

  final List<SneakerModel> sneakers;

  @override
  Widget build(BuildContext context) {
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
                image: NetworkImage(sneakers[index].image), fit: BoxFit.cover),
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Chip(label: Text("LKR ${sneakers[index].price}0")),
                    const Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.grey,
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
          ),
        );
      },
    );
  }
}
