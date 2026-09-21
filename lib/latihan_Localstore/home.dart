import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static const String _keyIsLoggedIn = "is_logged_in";
  static const String _keyDarkMode = "is_dark_mode";

  // Simpan status Login
  Future<void> setLoginStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, status);
  }

  // Ambil status Login
  Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  // Simpan status Dark Mode
  Future<void> setDarkMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyDarkMode, isDark);
  }

  // Ambil status Dark Mode
  Future<bool> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyDarkMode) ?? false;
  }
}