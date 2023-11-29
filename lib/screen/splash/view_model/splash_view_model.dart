import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> checkLogin(BuildContext context) async {
    final user = await SharedPreferencesUtils().getToken();
    if (user.isNotEmpty) {
      Timer(
        const Duration(seconds: 2),
        () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesNavigation.homeView,
            (route) => false,
          );
        },
      );
    } else {
      Timer(
        const Duration(seconds: 2),
        () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesNavigation.onboardingView,
            (route) => false,
          );
        },
      );
    }
  }
}
