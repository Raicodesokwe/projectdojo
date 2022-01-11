

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projectdojo/customroutes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
 final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;
  
  ThemeProvider() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if(_prefs == null)
      _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs()async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: Colors.black),
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder()
      }),
      textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Color(0xFF1D1D35),
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: Colors.white),
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder()
      }),
      textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white));
}

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
//elevation along z axis
//controls shadow size below material relative to parent and opacity of overlay color
