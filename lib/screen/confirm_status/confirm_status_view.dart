import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ConfirmStatusView extends StatelessWidget {
  const ConfirmStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    var status = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
              status,
              style: semiBold16Grey700,
            ),
          ],
        ),
      ),
    );
  }
}
