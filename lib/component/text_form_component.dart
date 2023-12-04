import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class TextFormComponent extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLines;
  final String hintText;
  final TextStyle hinstStyle;
  final bool? obscureText;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? textInputType;
  const TextFormComponent({
    super.key,
    required this.controller,
    this.obscureText,
    this.suffixIcon,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    required this.hinstStyle,
    this.textInputType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator,
      onChanged: onChanged,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18.0,
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
        hintStyle: hinstStyle,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: 24,
                color: grey200,
              )
            : null,
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
