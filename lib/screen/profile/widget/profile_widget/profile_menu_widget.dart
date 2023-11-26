import 'package:flutter/material.dart';

class ProfilMenuWidget extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final VoidCallback? onTap;
  final IconData? icon;
  const ProfilMenuWidget({
    super.key, 
    required this.title, 
    required this.textStyle, 
    this.onTap,
    this.icon
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: 47,
          decoration: ShapeDecoration(
            color: const Color(0xFFFAFAFA),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            ),
          child: Row(
            children: [
              Text(title,
              style: textStyle
              ),
              const Spacer(),
              Icon(icon),
            ],
          ),
          )
        ),
      );
  }
}