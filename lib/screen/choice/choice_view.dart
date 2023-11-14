import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/screen/login/login_view.dart';
import 'package:reprohealth_app/screen/register/register_view.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ChoiceView extends StatelessWidget {
  const ChoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 56.57,
              left: 56.1,
              right: 60.76,
              bottom: 43.69,
            ),
            child: Image.asset("assets/onboarding.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Selamat Datang di',
              style: semiBold16Grey300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Text(
              'ReproHealth',
              style: semiBold24Grey400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 63,
              right: 18,
              left: 16,
            ),
            child: Text(
              'Dengan akses mudah, informasi terpercaya, dan konsultasi yang nyaman, kami hadir untuk membantu Anda dalam mengakses layanan kesehatan reproduksi.',
              style: regular12Grey400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ButtonComponent(
              labelText: 'Masuk',
              labelStyle: semiBold12Primary,
              backgroundColor: green500,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ButtonComponent(
              labelText: 'Daftar Akun',
              labelStyle: semiBold12Green500,
              backgroundColor: Colors.transparent,
              elevation: 0,
              border: BorderSide(width: 1.5, color: green500),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterView(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
