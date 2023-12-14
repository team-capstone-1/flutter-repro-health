import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/services/auth_services/auth_services.dart';
import 'package:reprohealth_app/theme/theme.dart';

class RegisterViewModels with ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void isPasswordVisible() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  bool validateName(String name) {
    if (name.length < 3 || !name.substring(0, 1).contains(RegExp(r'[A-Z]'))) {
      return false;
    }
    return true;
  }

  bool validateEmail(String email) {
    final emailPattern = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9^`{|}~]+@gmail\.com$");
    if (!emailPattern.hasMatch(email)) {
      return false;
    }
    return true;
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

  Future<void> registerAccount({required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    try {
      await AuthServices().authRegister(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        context: context,
      );

      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();

      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesNavigation.successRegisterView,
          (route) => false,
        );
      }
    } catch (e) {
      if (context.mounted) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(Assets.assetsLoginWrong),
                  const SizedBox(height: 8),
                  Text(
                    "Proses Daftar Akun Gagal",
                    style: semiBold14Grey500,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Email sudah terdaftar di dalam sistem kami!!",
                    style: regular12Grey300,
                  ),
                  const SizedBox(height: 16),
                  ButtonComponent(
                    labelText: Text(
                      "Daftar Kembali",
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
        print("ini error");
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
