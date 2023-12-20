import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Widget labelText;
  final Color backgroundColor;
  final Function()? onPressed;
  final double? elevation;
  final BorderSide? border;

  const ButtonComponent({
    super.key,
    required this.labelText,
    required this.backgroundColor,
    required this.onPressed,
    this.elevation,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          side: border,
        ),
        onPressed: onPressed,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: labelText,
          ),
        ),
      ),
    );
  }
}
