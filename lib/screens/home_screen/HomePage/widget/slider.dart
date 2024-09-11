import 'package:addidas_ecommerce_app/providers/main_screen_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<MainScreenProvider>(context, listen: false)
            .fetchSliderImages(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasError) {
            return const SizedBox(
              height: 170,
              child: Center(
                child: Text("Something Went Wrong"),
              ),
            );
          }
          List<String> images = snapshot.data!;

          return CarouselSlider(
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
          );
        });
  }
}
