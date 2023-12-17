import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ChoiceView extends StatelessWidget {
  const ChoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 56.57,
                  left: 56.1,
                  right: 60.76,
                ),
                child: Image.asset(Assets.assetsOnboarding),
              ),
              const SizedBox(height: 44),
              Text(
                'Selamat Datang di',
                style: semiBold16Grey300,
              ),
              const SizedBox(height: 12),
              Text(
                'ReproHealth',
                style: semiBold24Grey400,
              ),
              const SizedBox(height: 12),
              Text(
                'Dengan akses mudah, informasi terpercaya, dan konsultasi yang nyaman, kami hadir untuk membantu Anda dalam mengakses layanan kesehatan reproduksi.',
                style: regular12Grey400,
              ),
              const SizedBox(height: 80),
              ButtonComponent(
                labelText: Text(
                  "Masuk",
                  style: semiBold12Primary,
                  textAlign: TextAlign.center,
                ),
                backgroundColor: green500,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutesNavigation.loginView,
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonComponent(
                labelText: Text(
                  "Daftar Akun",
                  style: semiBold12Green500,
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                border: BorderSide(width: 1.5, color: green500),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutesNavigation.registerView,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
