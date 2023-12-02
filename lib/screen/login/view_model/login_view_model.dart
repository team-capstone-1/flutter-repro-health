import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  String? _token = '';
  String? get token => _token;

  void saveToken(String newToken) {
    _token = newToken;
    notifyListeners();
  }

  void removeToken() {
    _token = '';
    notifyListeners();
  }
}