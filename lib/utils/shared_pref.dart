import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences> get preferences async {
    if (_preferences != null) {
      return _preferences!;
    }

    _preferences = await SharedPreferences.getInstance();
    return _preferences!;
  }

  static Future<void> saveToken(String token) async {
    final prefs = await preferences;
    prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await preferences;
    return prefs.getString('token');
  }

  static Future<void> removeToken() async {
    final prefs = await preferences;
    prefs.remove('token');
  }
}
