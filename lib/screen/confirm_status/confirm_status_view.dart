import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ConfirmStatusView extends StatelessWidget {
  const ConfirmStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 10),
            Text(
              "OKe",
              style: semiBold16Grey700,
            ),
            const SizedBox(height: 10),
            ButtonComponent(
              labelText: 'Lihat Transaksi',
              labelStyle: semiBold12Grey10,
              backgroundColor: green500,
              onPressed: () {
                if (kDebugMode) {
                  print('Lihat Transaksi');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
