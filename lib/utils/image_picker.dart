import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class FileImagePicker {
  ImagePicker picker = ImagePicker();

  Future<File?> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Logger().f(image.path);
      return File(image.path);
    } else {
      Logger().e("Try Again");
      return null;
    }
  }
}
