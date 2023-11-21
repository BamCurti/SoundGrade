import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightMode = true;

  void toggleTheme() {
    isLightMode = !isLightMode;
    notifyListeners();
  }
}
