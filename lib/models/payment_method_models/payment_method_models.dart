import 'package:dio/dio.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class PaymentMethod {
  final String method;
  final String name;
  final String accountNumber;
  final String image;

  PaymentMethod(
      {required this.method,
      required this.name,
      required this.accountNumber,
      required this.image});

  Map<String, dynamic> toJson() {
    return {
      'method': method,
      'name': name,
      'account_number': accountNumber,
      'image': image
    };
  }
}

class CreatePaymentService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> createPayment(
      String paymentId, PaymentMethod paymentMethod) async {
    final String url =
        'https://dev.reprohealth.my.id/transactions/$paymentId/payments';
    final String token = await SharedPreferencesUtils().getToken();

    try {
      final response = await _dio.post(
        url,
        data: paymentMethod.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      print(response.data);

      return response.data;
    } catch (e) {
      print('Error making payment: $e');
      throw Exception('Failed to make payment');
    }
  }
}
