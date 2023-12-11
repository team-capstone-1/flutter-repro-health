import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  const IconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 28,
        height: 28,
        decoration: ShapeDecoration(
          color: green500,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
            color: grey10,
            ),
          ],
        ),
      );
  }
}

