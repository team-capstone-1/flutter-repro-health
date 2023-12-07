import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/forum_models/forum_models.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class ForumServices {
  Future<ForumModels> getListForum() async {
    const String apiGetForum = "https://dev.reprohealth.my.id/forums";
    try {
      var response = await Dio().get(apiGetForum);
      return ForumModels.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load forum list: $error');
    }
  }

  Future<ForumModels> getListMyForum({required String patientId}) async {
    final String apiGetMyForum =
        "https://dev.reprohealth.my.id/forums?patient_id=$patientId";
    try {
      var response = await Dio().get(apiGetMyForum);
      return ForumModels.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load fourm list: $error');
    }
  }

  Future<void> createForum({
    required String patientId,
    required String title,
    required String content,
    required bool anonymous,
    required BuildContext context,
  }) async {
    const String apiCreateForum = "https://dev.reprohealth.my.id/forums";
    String token = await SharedPreferencesUtils().getToken();

    try {
      var response = await Dio().post(
        apiCreateForum,
        data: {
          "patient_id": patientId,
          "title": title,
          "content": content,
          "anonymous": anonymous,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            "Authorization": "Bearer $token",
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

  Future<void> deleteForum({
    required String forumId,
    required String title,
    required String content,
    required bool anonymous,
    required BuildContext context,
  }) async {
    final String apiDeleteForum =
        "https://dev.reprohealth.my.id/forums/$forumId";
    String token = await SharedPreferencesUtils().getToken();

    try {
      var response = await Dio().delete(
        apiDeleteForum,
        data: {
          "title": title,
          "content": content,
          "anonymous": anonymous,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            "Authorization": "Bearer $token",
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
