import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ChipAppointmentLengthWidget extends StatelessWidget {
  const ChipAppointmentLengthWidget({
    super.key,
    required this.text,
    required this.length,
  });

  final String text;
  final int? length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        Visibility(
          visible: length != null && length != 0,
          child: Container(
            margin: const EdgeInsets.only(left: 4),
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 4,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: negative,
            ),
            child: Text(
              length.toString(),
              style: regular10Negative25,
            ),
          ),
        ),
      ],
    );
  }
}
