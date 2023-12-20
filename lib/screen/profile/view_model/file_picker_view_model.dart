import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerViewModel with ChangeNotifier {
  FilePickerResult? _result;

  FilePickerResult? get result => _result;

  set result(FilePickerResult? value) {
    _result = value;
    notifyListeners();
  }
  
  void clearResult() {
    _result = null;
    notifyListeners();
  }

  Future<void> pickFile() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (resultFile != null) {
      _result = resultFile;
      notifyListeners();
    }
  }
}