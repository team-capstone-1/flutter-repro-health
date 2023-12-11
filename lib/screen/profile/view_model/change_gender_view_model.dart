import 'package:flutter/material.dart';

class ChangeGenderViewModel extends  ChangeNotifier {
  late final ValueNotifier<String> _groupValue = ValueNotifier("");
  ValueNotifier<String> get groupValue => _groupValue;

  String get selectedGender => _groupValue.value;

  void updateGender(String value) {
    _groupValue.value = value;
    notifyListeners();
  }
}