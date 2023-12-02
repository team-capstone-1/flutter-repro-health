import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/models/profile_models.dart';
import 'package:reprohealth_app/screen/login/view_model/login_view_model.dart';

class ProfileService {
  final String apiUrl = 'https://dev.reprohealth.my.id/patients';

  Future<ProfileModel> getProfileModel({required BuildContext context}) async {
    final String token = Provider.of<LoginViewModel>(context, listen: false).token ?? "";
    try {
      final response = await Dio().get(
        apiUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json', 
            'Authorization': 'Bearer $token'
            },
        ),
      );
      print(response.data);
      return ProfileModel.fromMap(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<void> postProfileFormData({
    required BuildContext context,
    required FormData formData,
  }) async {
    final String token = Provider.of<LoginViewModel>(context, listen: false).token ?? "";

    try {
      final response = await Dio().post(
        apiUrl,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error response: ${e.response!.data}');
      } else {
        print('Error: $e');
      }
      throw Exception(e.message);
    }
  }
}

