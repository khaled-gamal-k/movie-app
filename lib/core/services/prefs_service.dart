import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static late final SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future setData(String key, value) async {
    switch (value.runtimeType) {
      case const (String):
        return await _instance.setString(key, value);
      case const (bool):
        return await _instance.setBool(key, value);
      case const (int):
        return await _instance.setInt(key, value);
      case const (double):
        return await _instance.setDouble(key, value);
      default:
        return await _instance.setString(key, value);
    }
  }

  static String? getString(String key) => _instance.getString(key);

  static bool? getBool(String key) => _instance.getBool(key);

  static int? getInt(String key) => _instance.getInt(key);

  static double? getDouble(String key) => _instance.getDouble(key);

  static Future clear() async => await _instance.clear();

  static Future remove(String key) async => await _instance.remove(key);
}
