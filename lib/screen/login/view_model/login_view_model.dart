import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/services/auth_services/auth_services.dart';
import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/utils/login_sharedprefs_utils.dart';

class LoginViewModels extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

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

  Future<void> loginAccount({required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    try {
      await AuthServices().authLogin(
        email: _emailController.text,
        password: _passwordController.text,
        context: context,
      );

      if (_rememberMe == false) {
        await LoginSharedPreferencesUtils().removeCredentials();
      } else {
        await LoginSharedPreferencesUtils().addCredentials(
          emailValue: _emailController.text,
          passwordValue: _passwordController.text,
          rememberMeValue: _rememberMe,
        );
      }

      _emailController.clear();
      _passwordController.clear();

      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesNavigation.locationView,
          (route) => false,
        );
      }
    } catch (e) {
      if (context.mounted) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(Assets.assetsLoginWrong),
                  const SizedBox(height: 8),
                  Text(
                    "Proses Masuk Aplikasi Gagal",
                    style: semiBold14Grey500,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Email atau kata sandi yang anda masukkan salah",
                    style: regular12Grey300,
                  ),
                  const SizedBox(height: 16),
                  ButtonComponent(
                    labelText: Text(
                      "Masuk Kembali",
                      style: semiBold12Grey10,
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: green500,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          },
        );
      }
      if (kDebugMode) {
        print(e);
      }
    } finally {
      _isLoading = false; // loading state
      notifyListeners();
    }
  }

  Future<void> autoLogin() async {
    try {
      // Retrieve stored values
      final storedEmail = await LoginSharedPreferencesUtils().getEmail();
      final storedPassword = await LoginSharedPreferencesUtils().getPassword();
      final storedRememberMe =
          await LoginSharedPreferencesUtils().getRememberMe();

      if (storedEmail.isNotEmpty && storedPassword.isNotEmpty) {
        _emailController.text = storedEmail;
        _passwordController.text = storedPassword;
        _rememberMe = storedRememberMe;
      }
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
