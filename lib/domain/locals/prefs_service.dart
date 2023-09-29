import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants/app_constants.dart';

class PrefsService {
  static const _PREF_TOKEN_KEY = 'pref_token_key';
  static const _PREF_FIRST = 'pref_first_key';
  static const _PREF_LIST_HISTORY = 'pref_history_key';
  static const _PREF_CURRENCY = 'pref_currency';

  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static Future<bool> saveToken(String value) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_TOKEN_KEY, value);
  }

  static String getToken() {
    return _prefsInstance?.getString(_PREF_TOKEN_KEY) ?? '';
  }

  static String getHistoryTransaction() {
    return _prefsInstance?.getString(_PREF_LIST_HISTORY) ?? '';
  }

  static Future<bool> saveHistoryTransaction(String value) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_LIST_HISTORY, value);
  }

  static Future<bool> saveFirstLaunch(bool value) async {
    final prefs = await _instance;
    return prefs.setBool(_PREF_FIRST, value);
  }

  static bool get getFirstLaunch =>
      _prefsInstance?.getBool(_PREF_FIRST) ?? true;
      
  static Future<bool> saveCurrency(String value) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_CURRENCY, value);
  }

  static String get getCurrency =>
      _prefsInstance?.getString(_PREF_CURRENCY) ??
      AppConstants.currencySp.first;

  static Future<void> clearAuthData() async {
    await _prefsInstance?.remove(_PREF_TOKEN_KEY);
  }

  static Future<void> clearData() async {
    await _prefsInstance?.clear();
    return;
  }
}
