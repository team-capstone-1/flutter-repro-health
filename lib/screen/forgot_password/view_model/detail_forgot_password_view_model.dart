import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/services/change_password_services/change_password_services.dart';

class DetailForgotPasswordViewModel extends ChangeNotifier {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void togglePassword() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  bool validatePassword(String password) {
    if (password.length < 8 ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]'))) {
      return false;
    }
    return true;
  }

  Future<void> changePassword(
      {required BuildContext context, required String token}) async {
    _isLoading = true;
    notifyListeners();
    try {
      await ChangePasswordServices().changePassword(
        password: _confirmPasswordController.text,
        token: token,
      );
      if (context.mounted) {
        Navigator.pushNamed(
          context,
          RoutesNavigation.successChangePassword,
        );
        _passwordController.clear();
        _confirmPasswordController.clear();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Ini errornya: $e");
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
