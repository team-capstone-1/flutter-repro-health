import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class AuthServices {
  final String apiRegister = "https://dev.reprohealth.my.id/users/signup";
  final String apiLogin = "https://dev.reprohealth.my.id/users/login";

  Future<void> authRegister({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      var response = await Dio().post(
        apiRegister,
        data: {
          "name": name,
          "email": email,
          "password": password,
        },
      );
      print(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<void> authLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      var response = await Dio().post(
        apiLogin,
        data: {
          "email": email,
          "password": password,
        },
      );

      final token = response.data['response']['token'];
      await SharedPreferencesUtils().addToken(token);

      print(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }
}
