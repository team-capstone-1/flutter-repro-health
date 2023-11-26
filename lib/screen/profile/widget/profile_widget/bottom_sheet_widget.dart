import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class BottomSheetWidget {
  static void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 152,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pilih Foto',
              style: semiBold14Grey500
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: Text("Ambil foto",
                style: medium12Grey500
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Text("Pilih dari galeri",
                style: medium12Grey500
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
