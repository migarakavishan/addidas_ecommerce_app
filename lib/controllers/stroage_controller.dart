import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';

class StroageController {
  Future<String> uploadImage(String path, String fileName, File file) async {
    try {
      final reference = FirebaseStorage.instance.ref("$path/$fileName");
      final uploadTask = reference.putFile(file);
      final taskSnapshot = await uploadTask.whenComplete(() {});
      return await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }
}
