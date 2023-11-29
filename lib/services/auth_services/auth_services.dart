import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/login/view_model/login_view_model.dart';
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
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesNavigation.successRegisterView,
        (route) => false,
      );
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
      Provider.of<LoginViewModel>(context, listen: false).saveToken(token);

      print(response.data);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesNavigation.locationView,
        (route) => false,
      );
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }
}
