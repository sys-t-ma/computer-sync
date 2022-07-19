import 'package:computer_sync/src/shared/core/locale/locale_preferences.dart';
import 'package:flutter/material.dart';

class LocaleModel extends ChangeNotifier {
  LocalePreferences _preferences = LocalePreferences();
  String _locale = 'en';
  String get locale => _locale;

  LocaleModel() {
    _locale = 'en';
    _preferences = LocalePreferences();
    getPreferences();
  }

  set locale(String value) {
    _locale = value;
    _preferences.setLocale(value);
    notifyListeners();
  }

  getPreferences() async {
    _locale = await _preferences.getLocale();
    notifyListeners();
  }
}
