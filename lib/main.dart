import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/splash/splash_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ReproHealth+',
      home: SplashView(),
    );
  }
}