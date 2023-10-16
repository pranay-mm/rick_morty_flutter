import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kUserLoggedInKey = 'isUserLoggedIn';
const String _kThemFlagKey = 'themeFlag';
const String _kOnBoardingShowKey = 'onboarding_shown';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  // Persist and retrieve onboarding shown flag value
  bool get isOnBoardingShown => _getData(_kOnBoardingShowKey) ?? false;
  set isOnBoardingShown(bool value) => _saveData(_kOnBoardingShowKey, value);

  // Persist and retrieve user login flag value
  bool get isUserLoggedIn => _getData(_kUserLoggedInKey) ?? false;
  set isUserLoggedIn(bool value) => _saveData(_kUserLoggedInKey, value);

  // Persist and retrieve theme flag
  bool get themeFlagKey => _getData(_kThemFlagKey) ?? true;
  set themeFlagKey(bool value) => _saveData(_kThemFlagKey, value);

  dynamic _getData(String key) {
    // Retrieve data from shared preferences
    var value = _preferences.get(key);

    // Easily log the data that we retrieve from shared preferences
    debugPrint('Retrieved $key: $value');

    // Return the data that we retrieve from shared preferences
    return value;
  }

  void _saveData(String key, dynamic value) {
    // Easily log the data that we save to shared preferences
    debugPrint('Saving $key: $value');

    // Save data to shared preferences
    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }
}
