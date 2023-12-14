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
