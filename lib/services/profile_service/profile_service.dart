import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/profile_models/profile_models.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class ProfileService {
  final String apiUrl = 'https://dev.reprohealth.my.id/patients';

  Future<ProfileModel> getProfileModel({required BuildContext context}) async {
    final String token = await SharedPreferencesUtils().getToken();
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
      return ProfileModel.fromMap(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<void> postProfileFormData({
    required BuildContext context,
    required FormData formData,
  }) async {
    final String token = await SharedPreferencesUtils().getToken();

    try {
      await Dio().post(
        apiUrl,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        e.response!.data;
      } else {
        e;
      }
      throw Exception(e.message);
    }
  }


  Future<ProfileModel> getProfileModelId({
    required BuildContext context,
    required String idPatients
    }) async {
    final String token = await SharedPreferencesUtils().getToken();
    try {
      final response = await Dio().get(
        'https://dev.reprohealth.my.id/patients/$idPatients',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
            },
        ),
      );
      return ProfileModel.fromMap(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<ProfileModel> putProfileModel({
    required String idPatients,
    required FormData formData,
    }) async {
    final String token = await SharedPreferencesUtils().getToken();
    try {
      final response = await Dio().put(
        'https://dev.reprohealth.my.id/patients/$idPatients',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
            },
        ),
      );
      return ProfileModel.fromMap(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? 'Failed to perform operation');
    }
  }

  Future<ProfileModel> deleteProfileModelId({
    required BuildContext context, 
    required String idPatients
    }) async {
    final String token = await SharedPreferencesUtils().getToken();
    try {
      final response = await Dio().delete(
        'https://dev.reprohealth.my.id/patients/$idPatients',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
            },
        ),
      );
      return ProfileModel.fromMap(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

    Future<ProfileModel> changePassword({required String newPassword}) async {
    final String token = await SharedPreferencesUtils().getToken();
    try {
      final response = await Dio().put(
        'https://dev.reprohealth.my.id/users/change-password',
        data: {
          "password": newPassword,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
            },
        ),
      );
      return ProfileModel.fromMap(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? 'Failed to perform operation');
    }
  }
}

