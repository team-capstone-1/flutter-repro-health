import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerViewModel with ChangeNotifier {
  FilePickerResult? _result;
  Future<FilePickerResult?>? _resultFile;

  FilePickerResult? get result => _result;
  Future<FilePickerResult?>? get resultFile => _resultFile;

  set result(FilePickerResult? value) {
    _result = value;
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
