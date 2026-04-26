import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static final SharedPrefHelper _instance = SharedPrefHelper._internal();
  factory SharedPrefHelper() => _instance;
  SharedPrefHelper._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // ---- Generic methods for saving and retrieving data ----
  // ---- Bool methods ----
  Future<void> setDouble({required String key, required double value}) async {
    await _prefs?.setDouble(key, value);
  }

  double? getDouble({required String key}) {
    return _prefs?.getDouble(key);
  }

  // ---- Bool methods ----
  Future<void> setBool({required String key, required bool value}) async {
    await _prefs?.setBool(key, value);
  }

  bool? getBool({required String key}) {
    return _prefs?.getBool(key);
  }

  // ---- Int methods ----
  Future<void> setInt({required String key, required int value}) async {
    await _prefs?.setInt(key, value);
  }

  int? getInt({required String key}) {
    return _prefs?.getInt(key);
  }

  // ---- String methods ----
  Future<void> setString({required String key, required String value}) async {
    await _prefs?.setString(key, value);
  }

  String? getString({required String key}) {
    return _prefs?.getString(key);
  }
}
