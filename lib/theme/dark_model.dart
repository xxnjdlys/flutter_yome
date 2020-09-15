import 'package:flutter/material.dart';
import 'package:flutter_yome/utils/sp_util.dart';

import 'package:flutter_yome/application.dart';

class DarkMode with ChangeNotifier {
  bool _isDark = false;

  get isDark => _isDark;

  void updateDarkMode(isDark) {
    _isDark = isDark;
    notifyListeners();
    Application.sp.putBool(Preference.SP_DARK_MODEL, isDark);
  }
}
