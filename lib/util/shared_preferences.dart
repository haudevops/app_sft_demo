import 'package:shared_preferences/shared_preferences.dart';

/*
 * MissingPluginException(No implementation found for method getAll on channel flutter: plugins.flutter.io/shared_preferences)
 * >>> https://github.com/renefloor/flutter_cached_network_image/issues/50
 *
 * Fix bug:
    Run Flutter clean (or remove your build manually)
    if u are on IOS run pod install
    and then => Flutter run
 */

class SPref {
  SPref._internal();

  static final SPref instance = SPref._internal();

  Future set(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  dynamic get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  dynamic getOrDefault(String key, Object defaultValue) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key) ?? defaultValue;
  }

  Future remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future clear() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
