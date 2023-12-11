import 'package:flutter/material.dart';

class PilihSesiViewModel extends ChangeNotifier {
  //^ LIST sesi rescedhule
  //! ISI LIST JANGAN DI GANTI !!!
  // list sesi rescedhule sudah sesuai dengan request body api
  List<String> sessions = [
    "pagi",
    "siang",
    "malam",
  ];

  //^ SET selectionSession
  // [SESI] rescedhule yang dipilih oleh user
  String _selectedSession = '';
  String get selectedSession => _selectedSession;
  set setSelectedSession(String newSession) {
    notifyListeners();
    _selectedSession = newSession;
  }
}
