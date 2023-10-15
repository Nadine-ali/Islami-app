import 'package:flutter/material.dart';

class myProvider extends ChangeNotifier {
  String locale = 'en';
  ThemeMode theme = ThemeMode.light;

  changeLanguage(String langCode) {
    locale = langCode;
    notifyListeners();
  }

  changetheme(ThemeMode newTheme) {
    theme = newTheme;
    notifyListeners();
  }
}
