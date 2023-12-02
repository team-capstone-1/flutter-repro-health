import 'package:shared_preferences/shared_preferences.dart';

const String keyToken = "token";

class SharedPreferencesUtils {
  Future<void> addToken(String tokenValue) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(keyToken, tokenValue);
  }

  Future<void> removeToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(keyToken);
  }

  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(keyToken) ?? "";
  }
}