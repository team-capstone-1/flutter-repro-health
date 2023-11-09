import 'package:flutter/material.dart';

class OnboardingModels {
  final String title, description;
  final Image image;

  OnboardingModels({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingModels> onBoardingListData = [
  OnboardingModels(
    image: Image.asset(
      'assets/onboarding1.png',
      height: 281,
      width: 403,
    ),
    title: 'Ditangani oleh dokter berpengalaman',
    description:
        'Menyediakan dokter-dokter yang telah berpengalaman dibidangnya, sehingga kamu dapat sehat kembali',
  ),
  OnboardingModels(
    image: Image.asset(
      'assets/onboarding2.png',
      height: 281,
      width: 403,
    ),
    title: 'Atur Jadwal Konsultasi',
    description:
        'Atur jadwal janji temu dengan dokter dengan mudah melalui satu aplikasi',
  ),
  OnboardingModels(
    image: Image.asset(
      'assets/onboarding3.png',
      height: 281,
      width: 403,
    ),
    title: 'Tanyakan dan lihat diskusi forum',
    description:
        'Tanyakan dan lihat berbagai macam diskusi permasalahanmu melalui forum yang tersedia dengan berbagai ribuan dokter profesional',
  ),
];
