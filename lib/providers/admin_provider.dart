import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  final TextEditingController _priceController = TextEditingController();
  TextEditingController get priceController => _priceController;
}
