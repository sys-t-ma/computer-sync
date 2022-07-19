import 'package:shared_preferences/shared_preferences.dart';

class LocalePreferences {
  static const String prefKey = 'locale';

  setLocale(String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(prefKey, value);
  }

  getLocale() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(prefKey) ?? 'en';
  }
}
