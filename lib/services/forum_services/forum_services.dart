import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/forum_models/forum_models.dart';
import 'package:reprohealth_app/screen/login/view_model/login_view_model.dart';

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

  Future<ForumModels> createForum({
    required String title,
    required String content,
    required bool anonymous,
    required BuildContext context,
  }) async {
    const String apiCreateForum = "https://dev.reprohealth.my.id/forums";
    String token =
        Provider.of<LoginViewModel>(context, listen: false).token ?? '';

    try {
      var response = await Dio().post(
        apiCreateForum,
        data: {
          "patient_id": "0c3255e5-c998-4a14-9484-e815a6359de4",
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
      print(response.data);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesNavigation.homeView,
        (route) => false,
      );
      return ForumModels.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<ForumModels> deleteForum({
    required String forumId,
    required String title,
    required String content,
    required bool anonymous,
    required BuildContext context,
  }) async {
    final String apiDeleteForum =
        "https://dev.reprohealth.my.id/forums/$forumId";
    String token =
        Provider.of<LoginViewModel>(context, listen: false).token ?? '';

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
      print(response.data);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesNavigation.detailForumView,
        (route) => false,
      );
      return ForumModels.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }
}
