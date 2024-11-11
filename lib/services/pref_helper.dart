import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {

  Future<bool> getThemeMode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? val = pref.getBool("isLight");
    if (val == null) {
      return true;
    } else {
      return val;
    }
  }

  Future<bool> setThemeMode(bool val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isLight", val);
    return val;
  }

  Future<bool> getAppIsFresh() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? val = pref.getBool("appIsFresh");
    if (val == null) {
      return true;
    } else {
      return val;
    }
  }

  setAppIsFresh(bool val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("appIsFresh", val);
  }
}
