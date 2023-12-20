import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/profile/view_model/image_picker_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class BottomSheetWidget {
  static void bottomSheet(BuildContext context) {
    final imagePicker = Provider.of<ImagePickerViewModel>(context, listen: false);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 152,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pilih Foto',
                style: semiBold14Grey500,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  imagePicker.pickImage();
                  Navigator.pop(context);
                },
                child: Text(
                  "Ambil foto",
                  style: medium12Grey500,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  imagePicker.pickImage(
                    isCamera: false
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  "Pilih dari galeri",
                  style: medium12Grey500,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
