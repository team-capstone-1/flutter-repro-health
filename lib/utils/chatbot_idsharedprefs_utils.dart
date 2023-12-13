import 'package:shared_preferences/shared_preferences.dart';

const String keyUserId = "token";

class ChatbotIdSharedprefs {
  Future<void> addUserId(String userId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(keyUserId, userId);
  }

  Future<void> removeUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(keyUserId);
  }

  Future<String> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(keyUserId) ?? "";
  }
}
