import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class PaymentServices {
  final Dio _dio = Dio();

  Future<void> createPayment({
    required String idTransaction,
    required String name,
    required String accountNumber,
    required XFile image,
  }) async {
    final String url =
        'https://dev.reprohealth.my.id/transactions/$idTransaction/payments';
    final String token = await SharedPreferencesUtils().getToken();

    FormData formData = FormData.fromMap({
      "name": name,
      "account_number": accountNumber,
      "image": await MultipartFile.fromFile(image.path, filename: image.name),
    });

    try {
      final response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
        ),
      );

      if (kDebugMode) {
        print(response.data);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data);
    }
  }
}
