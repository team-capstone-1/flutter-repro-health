import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/services/payment_services/payment_services.dart';
import 'package:reprohealth_app/theme/theme.dart';

class PaymentViewModel extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _rekController = TextEditingController();
  TextEditingController get rekController => _rekController;

  final ImagePicker _imagePicker = ImagePicker();
  ImagePicker get imagePicker => _imagePicker;
  XFile? _pickedImage;
  XFile? get pickedImage => _pickedImage;

  Future<void> showImagePicker({required BuildContext context}) async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilih Foto',
                  style: semiBold16Black,
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _imagePicker.pickImage(
                      source: ImageSource.camera,
                    );
                    _handlePickedImage(pickedFile);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Ambil Foto',
                      style: regular14Grey900,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _imagePicker.pickImage(
                        source: ImageSource.gallery);
                    _handlePickedImage(pickedFile);
                  },
                  child: Text(
                    'Pilih dari Galeri',
                    style: regular14Grey900,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _handlePickedImage(XFile? pickedFile) {
    if (pickedFile != null) {
      _pickedImage = pickedFile;
      notifyListeners();
    }
  }

  Future<void> createPayment({
    required BuildContext context,
    required String idTransaction,
  }) async {
    try {
      File imageFile = File(_pickedImage!.path);
      print(imageFile);

      await PaymentServices().createPayment(
        idTransaction: idTransaction,
        name: _nameController.text,
        accountNumber: _rekController.text,
        image: imageFile.toString(),
      );

      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesNavigation.confirmSplashView,
          (route) => false,
        );
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
