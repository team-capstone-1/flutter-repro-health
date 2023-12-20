import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ConfirmStatusView extends StatelessWidget {
  const ConfirmStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    var status = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsSucessedConfirm,
              fit: BoxFit.contain,
              height: 240,
            ),
            const SizedBox(height: 10),
            Text(
              status,
              style: semiBold16Grey700,
            ),
            const SizedBox(height: 10),
            ButtonComponent(
              labelText: Text(
                "Lihat Transaksi",
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
            ),
          ],
        ),
      ),
    );
  }
}
