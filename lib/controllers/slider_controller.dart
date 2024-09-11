import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SliderController {
  CollectionReference admin = FirebaseFirestore.instance.collection("Admin");

  Future<void> updateSliderImage(List<String> imageList) async {
    await admin.doc("home_slider").set({"imageList": imageList}).then((value) {
      Logger().f("Home Slider Updated");
    });
  }

  Future<List<String>?> fetchSliderImages(BuildContext context) async {
    List<String> images = await admin.doc("home_slider").get().then((value) {
      List<String> images =
          ((value.data() as Map<String, dynamic>)['imageList'] as List<dynamic>)
              .map((e) => e.toString())
              .toList();

      return images;
    });
    return images;
  }
}
