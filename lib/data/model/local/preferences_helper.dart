import 'package:blog/data/model/remote/response/blog_response.dart';

abstract class PreferencesHelper {
  // Future<String> getToken();

  // Future<void> saveUserInfo(LoginResponse value, bool rememberLogin);

  // Future<LoginResponse?> getUserInfo();

  Future<void> clearUserInfo();
  Future<void> clearAllInfor();

  Future<void> saveTheme(bool value);
  Future<void> getTheme();

  Future<void> saveMail(String value);
  Future<void> getMail();
}
