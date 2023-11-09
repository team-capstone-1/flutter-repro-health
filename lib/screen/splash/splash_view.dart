import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reprohealth_app/screen/onboarding/onbarding_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingView()),
        (route) => false,
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFE8F9F6),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 314,
          left: 48.5,
          right: 48.5,
          bottom: 380,
        ),
        child: SvgPicture.asset('assets/logo_kesamping.svg', height: 85, width: 278,),
      ),
    );
  }
}
