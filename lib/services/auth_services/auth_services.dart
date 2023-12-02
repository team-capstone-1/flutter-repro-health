import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/login/view_model/login_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class AuthServices {
  final String apiRegister = "https://dev.reprohealth.my.id/users/signup";
  final String apiLogin = "https://dev.reprohealth.my.id/users/login";
  final String apiCreatePatient = "https://dev.reprohealth.my.id/patients";

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
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(Assets.assetsLoginWrong),
                  const SizedBox(height: 8),
                  Text(
                    "Proses Masuk Aplikasi Gagal",
                    style: semiBold14Grey500,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Email atau kata sandi yang anda masukkan salah",
                    style: regular12Grey300,
                  ),
                  const SizedBox(height: 16),
                  ButtonComponent(
                    labelText: "Masuk kembali",
                    labelStyle: semiBold12Grey10,
                    backgroundColor: green500,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          });
      throw Exception(e.response);
    }
  }

  // Future<void> createPatientLogin({
  //   required String name,
  //   required BuildContext context,
  // }) async {
  //   String token =
  //       Provider.of<LoginViewModel>(context, listen: false).token ?? '';
  //   try {
  //     var response = await Dio().post(
  //       apiCreatePatient,
  //       data: {
  //         "name": name,
  //         "date_of_birth": DateTime.now(),
  //       },
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           "Authorization": "Bearer $token",
  //         },
  //       ),
  //     );
  //     print(response.data);
  //   } on DioException catch (e) {
  //     throw Exception(e.response);
  //   }
  // }
}
