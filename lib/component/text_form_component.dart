import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class TextFormComponent extends StatelessWidget {
  final TextEditingController controller;
  final String errortext, hintText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  const TextFormComponent({
    super.key,
    required this.controller,
    required this.errortext,
    this.obscureText,
    this.suffixIcon,
    required this.hintText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errortext;
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: grey500,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: grey200,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: negative,
          ),
          borderRadius: BorderRadius.circular(6),
        ),        
        errorStyle: regular8Negative,
        hintText: hintText,
        hintStyle: regular12Grey300,
        prefixIcon: Icon(
          prefixIcon,
          size: 24,
          color: grey200,
        ),
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
