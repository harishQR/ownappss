import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprovider extends ChangeNotifier {
  var currentTheme = 'dark';

  ThemeMode get themeMode {
    if (currentTheme == 'light') {
      return ThemeMode.light;
    }
    else if (currentTheme == 'dark') {
      return ThemeMode.dark;
    }
    else {
      return ThemeMode.system;
    }
  }

  changeTheme(String theme) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('theme', theme);
    currentTheme = theme;
    notifyListeners();
  }

  initialize() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    currentTheme = pref.getString('theme') ?? 'dark';
    notifyListeners();
  }
}
