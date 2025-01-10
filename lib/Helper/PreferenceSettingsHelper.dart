
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceSettingsHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferenceSettingsHelper({required this.sharedPreferences});

  static const dailyNotification = 'daily_notification';

  Future<bool> get isDailyNotificationActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyNotification) ?? false;
  }

  void setDailyNotification(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyNotification, value);
  }

  static const darkTheme = 'dark_theme';
  static const serverIP = 'serverIP';


  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreferences;
    return prefs.getBool(darkTheme) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(darkTheme, value);
  }

  Future<String> get getServerIp async {
    final prefs = await sharedPreferences;
    return prefs.getString(serverIP) ?? "";
  }

  setServerIp(String value) async {
    final prefs = await sharedPreferences;
    prefs.setString(serverIP, value);
    prefs.commit();
  }


  saveSettings( phenixUser) async {
    final prefs = await sharedPreferences;
    //prefs.setBool(isRegistred,LocalDataHelper.isRegistred);
    await prefs.commit();
  }




}