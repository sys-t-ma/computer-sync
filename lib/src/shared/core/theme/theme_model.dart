import 'package:computer_sync/src/shared/core/theme/theme_preferences.dart';
import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  ThemePreferences _preferences = ThemePreferences();
  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}
