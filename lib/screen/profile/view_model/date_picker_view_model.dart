import 'package:flutter/material.dart';

class DatePickerViewModel with ChangeNotifier{
    DateTime _dueDate = DateTime.now();
    DateTime _currentDate = DateTime.now();

    DateTime get dueDate => _dueDate;
    DateTime get currentDate => _currentDate;

    set dueDate(DateTime newDate) {
    _dueDate = newDate;
    notifyListeners();
  }

    set currentDate (DateTime newDate) {
      _currentDate = newDate;
      notifyListeners();
    }
    
}