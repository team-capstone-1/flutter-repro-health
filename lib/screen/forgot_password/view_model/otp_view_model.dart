import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/services/change_password_services/change_password_services.dart';
import 'package:reprohealth_app/theme/theme.dart';

class OtpViewModel extends ChangeNotifier {
  final TextEditingController _otp1Controller = TextEditingController();
  final TextEditingController _otp2Controller = TextEditingController();
  final TextEditingController _otp3Controller = TextEditingController();
  final TextEditingController _otp4Controller = TextEditingController();
  final TextEditingController _otp5Controller = TextEditingController();

  TextEditingController get otp1Controller => _otp1Controller;
  TextEditingController get otp2Controller => _otp2Controller;
  TextEditingController get otp3Controller => _otp3Controller;
  TextEditingController get otp4Controller => _otp4Controller;
  TextEditingController get otp5Controller => _otp5Controller;

  @override
  void dispose() {
    _otp1Controller.dispose();
    _otp2Controller.dispose();
    _otp3Controller.dispose();
    _otp4Controller.dispose();
    _otp5Controller.dispose();
    super.dispose();
  }

  String getCombinedOtp() {
    final otp1 = _otp1Controller.text;
    final otp2 = _otp2Controller.text;
    final otp3 = _otp3Controller.text;
    final otp4 = _otp4Controller.text;
    final otp5 = _otp5Controller.text;

    return '$otp1$otp2$otp3$otp4$otp5';
  }

  Future<void> validateOtp({
    required BuildContext context,
    required String email,
  }) async {
    try {
      final token = await ChangePasswordServices().validateOtp(
        email: email,
        otp: getCombinedOtp(),
      );

      if (context.mounted) {
        if (token.isNotEmpty == true) {
          Navigator.pushNamed(
            context,
            RoutesNavigation.detailForgotPasswordView,
            arguments: token,
          );
          _otp1Controller.clear();
          _otp2Controller.clear();
          _otp3Controller.clear();
          _otp4Controller.clear();
          _otp5Controller.clear();
        }
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
                    "Proses Validasi OTP Gagal",
                    style: semiBold14Grey500,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Kode OTP yang anda masukkan salah!!",
                    style: regular12Grey300,
                  ),
                  const SizedBox(height: 16),
                  ButtonComponent(
                    labelText: Text(
                      "Validasi Kembali",
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
      print("Ini error: $e");
    }
  }

  Future<void> sendEmail(
      {required BuildContext context, required String email}) async {
    try {
      await ChangePasswordServices().postEmail(email: email);
    } catch (e) {
      print("Ini errornya: $e");
    }
  }
}
