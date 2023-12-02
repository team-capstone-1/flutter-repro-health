import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLines;
  final int? maxLength;
  final String hintText;
  final TextStyle hinstStyle;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  const TextFormWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    required this.hinstStyle,
    this.textInputType,
    this.maxLines,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
      validator: validator,
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
            color: grey900,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: grey900,
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
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
