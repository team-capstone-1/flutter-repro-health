import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ChangePasswordServices {
  Future<void> postEmail({required String email}) async {
    String apiPostEmail = "https://dev.reprohealth.my.id/users/send-otp";
    try {
      var response = await Dio().put(
        apiPostEmail,
        data: {
          "email": email,
        },
      );
      if (kDebugMode) {
        print(response.data);
      }
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<String> validateOtp(
      {required String email, required String otp}) async {
    String apiValidateOtp = "https://dev.reprohealth.my.id/users/validate-otp";
    try {
      var response = await Dio().put(
        apiValidateOtp,
        data: {
          "email": email,
          "otp": otp,
        },
      );
      if (kDebugMode) {
        print(response.data);
      }
      final token = response.data['response']['token'];
      return token;
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<void> changePassword({required String password, required String token}) async {
    String apiValidateOtp =
        "https://dev.reprohealth.my.id/users/change-password";
    try {
      var response = await Dio().put(
        apiValidateOtp,
        data: {
          "password": password,
        },
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
      throw Exception(e.response);
    }
  }
}
