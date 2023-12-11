import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? errorText, label;
  final String? Function(String?)? validator;
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.textInputType,
    this.errorText,
    this.label,
    this.validator
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}


class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isFilled = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      onChanged: (value) {
      setState(() {
        _isFilled = value.isNotEmpty;
      });
    },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        errorText: widget.errorText,
        hintText: widget.hintText,
        hintStyle: regular12Grey200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: green500
          ),
      ),
      enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: _isFilled ? grey500 : grey200,
        width: 1,
      ),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
      
      ),
    );
  }
}