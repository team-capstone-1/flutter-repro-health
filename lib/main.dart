import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/appoinment/appoinment_view.dart';
import 'package:reprohealth_app/screen/article/article_view.dart';
import 'package:reprohealth_app/screen/choice/choice_view.dart';
import 'package:reprohealth_app/screen/forgot_password/detail_forgot_password_view.dart';
import 'package:reprohealth_app/screen/forgot_password/forgot_password_view.dart';
import 'package:reprohealth_app/screen/forgot_password/otp_view.dart';
import 'package:reprohealth_app/screen/forum/forum_view.dart';
import 'package:reprohealth_app/screen/home/home_view.dart';
import 'package:reprohealth_app/screen/login/login_view.dart';
import 'package:reprohealth_app/screen/onboarding/onbarding_view.dart';
import 'package:reprohealth_app/screen/profile/profile_view.dart';
import 'package:reprohealth_app/screen/register/register_view.dart';
import 'package:reprohealth_app/screen/register/success_register_view.dart';
import 'package:reprohealth_app/screen/riwayat/riwayat_view.dart';
import 'package:reprohealth_app/screen/splash/splash_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ReproHealth+',
      initialRoute: RoutesNavigation.splashView,
      routes: {
        RoutesNavigation.splashView: (context) => const SplashView(),
        RoutesNavigation.onboardingView: (context) => const OnboardingView(),
        RoutesNavigation.choiceView: (context) => const ChoiceView(),
        RoutesNavigation.loginView: (context) => const LoginView(),
        RoutesNavigation.registerView: (context) => const RegisterView(),
        RoutesNavigation.successRegisterView: (context) => const SuccessRegisterView(),
        RoutesNavigation.forgotPasswordView: (context) => const ForgotPasswordView(),
        RoutesNavigation.otpView: (context) => const OtpView(),
        RoutesNavigation.detailForgotPasswordView: (context) => const DetailForgotPasswordView(),

        RoutesNavigation.homeView: (context) => const HomeView(),
        RoutesNavigation.appointmenView: (context) => const AppoinmentView(),
        RoutesNavigation.articleView: (context) => const ArticleView(),
        RoutesNavigation.forumView: (context) => const ForumView(),
        RoutesNavigation.riwayatView: (context) => const RiwayatView(),
        RoutesNavigation.profileView: (context) => const ProfileView(),
      },
    );
  }
}