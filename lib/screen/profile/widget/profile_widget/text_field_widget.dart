import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? errorText, label;
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.textInputType,
    this.errorText, 
    this.label
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          errorText: errorText,
          hintText: hintText,
          hintStyle: regular12Grey200,
          border: const OutlineInputBorder(),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onChanged: onChanged,
      ),
    );
  }
}