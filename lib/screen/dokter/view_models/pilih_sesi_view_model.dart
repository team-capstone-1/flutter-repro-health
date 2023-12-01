import 'package:flutter/material.dart';

class PilihSesiViewModel extends ChangeNotifier {
  final List<String> _sessions = [
    "Pagi 08.00-11.00",
    "Siang 13.00-15.30",
    "Malam 19.00-20.30",
  ];

  List<String> get sessions => _sessions;

  String _selectedSession = "";
  String get selectedSession => _selectedSession;

  void setSelectedSession(String session) {
    _selectedSession = session;
    notifyListeners();
  }
}
