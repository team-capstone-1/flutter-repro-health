import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/screen/appoinment/view_models/appoinment_view_model.dart';
import 'package:reprohealth_app/screen/splash/view_model/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Provider.of<SplashViewModel>(context, listen: false).checkLogin(context);
      Provider.of<AppoinmentViewModel>(context, listen: false).determinePosition(context);
    });

    return Scaffold(
      backgroundColor: const Color(0xFFE8F9F6),
      body: Center(
        child: SvgPicture.asset(
          Assets.assetsLogoKesamping,
          height: 85,
          width: 278,
        ),
      ),
    );
  }
}