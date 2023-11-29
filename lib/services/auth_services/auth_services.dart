import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_token_view_model.dart';

class AuthServices {
  final String apiRegister = "http://35.194.20.168:8080/users/signup";
  final String apiLogin = "http://35.194.20.168:8080/users/login";

  Future<void> authRegister({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      var response = await Dio().post(
        apiRegister,
        data: {
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

      final getToken = Provider.of<GetTokenViewModel>(context, listen: false);
      getToken.setToken(response.data['response']['token']);


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