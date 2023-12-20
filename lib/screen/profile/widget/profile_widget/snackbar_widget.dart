import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    Key? key,
    String contentText =  "",
    Color backgroundColor = Colors.greenAccent,
    VoidCallback? onPressed,
  }) : super(
          key: key,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              contentText,
              style: semiBold12grey5,
            ),
          ),
        );
}
