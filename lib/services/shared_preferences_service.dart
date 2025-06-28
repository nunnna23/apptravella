import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken(String token) async {
    await _prefs.setString('auth_token', token);
  }

  static String? getToken() {
    return _prefs.getString('auth_token');
  }

  static Future<void> saveCredentials(String email, String password) async {
    await _prefs.setString('user_email', email);
    await _prefs.setString('user_password', password);
  }

  static Map<String, String>? getCredentials() {
    final email = _prefs.getString('user_email');
    final password = _prefs.getString('user_password');
    if (email != null && password != null) {
      return {'Email': email, 'Password': password};
    }
    return null;
  }

  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}
