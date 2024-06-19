import 'package:addidas_ecommerce_app/components/custom_text/custom_poppins_text.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  TopCategories({
    super.key,
  });

  final List<IconData> icons = [
    Icons.shopping_basket,
    Icons.g_translate,
    Icons.abc_outlined,
    Icons.access_alarm,
    Icons.accessibility_sharp,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomPoppinsText(
              text: "Top Categories",
              fontWeight: FontWeight.w500,
            ),
            CustomPoppinsText(
              text: "See All",
              color: Colors.orange.shade700,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
              children: List.generate(icons.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: index == 0 ? Colors.orange : Colors.grey.shade300,
                    border: Border.all(
                        color: index == 0
                            ? Colors.orange.shade700
                            : Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  icons[index],
                  color: index == 0 ? Colors.white : Colors.grey.shade700,
                ),
              ),
            );
          })),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
