import 'package:addidas_ecommerce_app/providers/main_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderUpdate extends StatefulWidget {
  const SliderUpdate({super.key});

  @override
  State<SliderUpdate> createState() => _SliderUpdateState();
}

class _SliderUpdateState extends State<SliderUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Slider Settings'),
      ),
      body: Consumer<MainScreenProvider>(builder: (context, value, child) {
        return Column(
          children: [
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                value.currentPickImage == null
                    ? GestureDetector(
                        onTap: () {
                          value.pickSliderImage(context);
                        },
                        child: const Icon(
                          Icons.add_a_photo,
                          size: 80,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          value.pickSliderImage(context);
                        },
                        child: Container(
                          width: 120,
                          height: 75,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(value.currentPickImage!)),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                FilledButton(
                    onPressed: () {
                      value.uploadImage();
                    },
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                    child: const Text("Upload Image"))
              ],
            ),
            const Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                    future: value.fetchSliderImages(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text("Something went wrong"));
                      }
                      List<String> images = snapshot.data!;
                      return GridView.builder(
                        itemCount: images.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                childAspectRatio: 1.5),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(images[index])),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        },
                      );
                    }),
              ),
            )
          ],
        );
      }),
    );
  }
}
