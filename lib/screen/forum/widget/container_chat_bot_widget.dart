import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ContainerChatBotWidget extends StatelessWidget {
  final String text;

  const ContainerChatBotWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: grey400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: regular14Grey400,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
