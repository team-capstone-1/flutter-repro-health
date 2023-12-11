import 'package:flutter/material.dart';

class LoginViewModels extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;

  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    notifyListeners();
  }

  void togglePassword() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  bool validateEmail(String email) {
    final emailPattern =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9^`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailPattern.hasMatch(email)) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
