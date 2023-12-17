import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ConfirmationSplashView extends StatelessWidget {
  const ConfirmationSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsConfirmationSplash,
              width: 319,
              height: 303,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 319,
              child: Text(
                'Pembayaranmu segera dikonfirmasi, silahkan menunggu',
                style: semiBold14Black,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonComponent(
              labelText: Text(
                "Lihat rincian",
                style: semiBold12Grey10,
                textAlign: TextAlign.center,
              ),
              backgroundColor: green500,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesNavigation.homeView,
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
