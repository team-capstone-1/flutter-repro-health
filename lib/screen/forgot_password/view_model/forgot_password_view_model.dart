import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/services/change_password_services/change_password_services.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool validateEmail(String email) {
    final emailPattern = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9^`{|}~]+@gmail\.com$");
    if (!emailPattern.hasMatch(email)) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> sendEmail({required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    try {
      await ChangePasswordServices().postEmail(email: _emailController.text);
      if (context.mounted) {
        Navigator.pushNamed(
          context,
          RoutesNavigation.otpView,
          arguments: _emailController.text,
        );
        _emailController.clear();
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
                    "Proses Send OTP Gagal",
                    style: semiBold14Grey500,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Email yang anda masukkan tidak terdaftar dalam aplikasi kita!!",
                    style: regular12Grey300,
                  ),
                  const SizedBox(height: 16),
                  ButtonComponent(
                    labelText: Text(
                      "Kembali",
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
        print("Ini errornya: $e");
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
