import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/notification_models.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class NotificationService {
  final SharedPreferencesUtils _sharedPreferencesUtils = SharedPreferencesUtils();


  Future<NotificationModel> getNotification({
    required BuildContext context,
    required String idPatients
    }) async {
    String token = await _sharedPreferencesUtils.getToken();
    try {
      final response = await Dio().get(
        'https://dev.reprohealth.my.id/notifications/patients/$idPatients?category=i',
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
      return NotificationModel.fromMap(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

}

