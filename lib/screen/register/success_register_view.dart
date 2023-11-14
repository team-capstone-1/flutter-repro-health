import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/screen/login/login_view.dart';
import 'package:reprohealth_app/theme/theme.dart';

class SuccessRegisterView extends StatelessWidget {
  const SuccessRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 180),
            Center(child: Image.asset('assets/success_register.png')),
            const SizedBox(height: 48),
            Text(
              'Daftar Akun Berhasil',
              style: semiBold24Grey500,
            ),
            const SizedBox(height: 12),
            Text(
              'Silahkan masuk!',
              style: medium16Grey500,
            ),
            const SizedBox(height: 32),
            ButtonComponent(
              labelText: 'Masuk',
              labelStyle: semiBold12Primary,
              backgroundColor: green500,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
