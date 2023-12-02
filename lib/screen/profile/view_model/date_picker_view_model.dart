import 'package:flutter/material.dart';

class DatePickerViewModel with ChangeNotifier{
    DateTime _dueDate = DateTime.now();
    final _currentDate = DateTime.now();

    DateTime get dueDate => _dueDate;
    get currentDate => _currentDate;

    set dueDate(DateTime newDate) {
    _dueDate = newDate;
    notifyListeners(); 
  }
    
}