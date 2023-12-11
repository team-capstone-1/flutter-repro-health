import 'package:shared_preferences/shared_preferences.dart';

const String keyEmail = "email";
const String keyPassword = "password";
const String keyRememberMe = "rememberMe";

class LoginSharedPreferencesUtils {
  Future<void> addCredentials({
    required String emailValue,
    required String passwordValue,
    required bool rememberMeValue,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(keyEmail, emailValue);
    sharedPreferences.setString(keyPassword, passwordValue);
    sharedPreferences.setBool(keyRememberMe, rememberMeValue);
  }

  Future<void> removeCredentials() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(keyEmail);
    await sharedPreferences.remove(keyPassword);
    await sharedPreferences.remove(keyRememberMe);
  }

  Future<String> getEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(keyEmail) ?? "";
  }

  Future<String> getPassword() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(keyPassword) ?? "";
  }

  Future<bool> getRememberMe() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(keyRememberMe) ?? false;
  }
}
