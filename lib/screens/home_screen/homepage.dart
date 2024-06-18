import 'package:addidas_ecommerce_app/components/custom_text/custom_poppins_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    "https://i.pinimg.com/736x/27/52/d7/2752d7e9b1de20834ebd12b61ff33569.jpg",
    "https://img.freepik.com/premium-photo/pair-shoes-wooden-deck-with-landscape-background_777078-2046.jpg",
    "https://storage.googleapis.com/bitr-cdn/wp-content/uploads/2024/01/saucony-endorphin-pro-4-landscape-alley.jpg",
    "https://i8.amplience.net/i/office/DN_PIC_landscape_2",
    "https://www.instyle.com/thmb/yNwBn2QCADyJXh5PHXzCCvCSPos=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/01-Landscape-aaa5c2196da743439f5cfd309d8be943.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomPoppinsText(
              text: "Hello Kamal",
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
            CarouselSlider(
              options: CarouselOptions(height: 170, autoPlay: true),
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.amber,
                          image: DecorationImage(
                              image: NetworkImage(i), fit: BoxFit.cover)),
                    );
                  },
                );
              }).toList(),
            )
          ],
        ),
      )),
    );
  }
}
