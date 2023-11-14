import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reprohealth_app/theme/theme.dart';

class OtpWidget extends StatelessWidget {
  final TextEditingController otpController;
  const OtpWidget({
    super.key,
    required this.otpController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: TextFormField(
        controller: otpController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(
          hintText: ('0'),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: green500,
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
        ),
        onSaved: (value) {},
      ),
    );
  }
}
