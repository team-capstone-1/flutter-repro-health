import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerViewModel with ChangeNotifier {
  XFile? _file;
  get file => _file;

  Future<void> pickImage({bool isCamera = true }) async {
    final result = await ImagePicker().pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);

    if (result != null) {
      _file = result;
      notifyListeners();
    }
  }

    void clearResult() {
    _file = null;
    notifyListeners();
  }
}