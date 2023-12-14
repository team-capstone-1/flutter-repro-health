import 'package:dio/dio.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class PaymentServices {
  final Dio _dio = Dio();

  Future<void> createPayment(
      {required String idTransaction,
      required String name,
      required String accountNumber,
      required String image}) async {
    final String url =
        'https://dev.reprohealth.my.id/transactions/$idTransaction/payments';
    final String token = await SharedPreferencesUtils().getToken();

    try {
      final response = await _dio.post(
        url,
        data: {
          "name": name,
          "account_number": accountNumber,
          "image": image,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
        ),
      );

      print(response.data);
    } catch (e) {
      throw Exception('Failed to make payment $e');
    }
  }
}
