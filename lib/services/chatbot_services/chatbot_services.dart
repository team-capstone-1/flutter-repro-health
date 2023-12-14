import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class ChatbotServices {
  Future<String> postChatbotServices({required String messages}) async {
    //url
    String url =
        'https://dev.reprohealth.my.id/chatbot/users-health-recommendation';
    //get token
    String token = await SharedPreferencesUtils().getToken();
    //data
    Map<String, dynamic> data = {"message": messages};
    //headers
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
    };

    // make request
    try {
      var response = await Dio().post(
        url,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      final messages = response.data['data'];
      if (kDebugMode) {
        print(messages);
      }
      return messages;
    } on DioException catch (e) {
      throw Exception('FAILED TO SEND MESSAGES ${e.response}');
    }
  }
}
