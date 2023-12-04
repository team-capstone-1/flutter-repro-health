import 'package:flutter/material.dart';

class PilihTanggalViewModel extends ChangeNotifier {
  DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;
  DateTime _dueDate = DateTime.now();
  DateTime get dueDate => _dueDate;

  set dueDate(DateTime value) {
    _dueDate = value;
    notifyListeners();
  }

  set currentDate(DateTime value) {
    _currentDate = value;
    notifyListeners();
  }
}
