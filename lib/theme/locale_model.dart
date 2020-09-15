import 'package:flutter/material.dart';
import 'package:flutter_yome/constant/Constants.dart';
import 'package:flutter_yome/utils/sp_util.dart';

import 'package:flutter_yome/application.dart';
import 'package:flutter_yome/generated/l10n.dart';

class LocaleModel with ChangeNotifier {
  int _localeIndex;

  get localeIndex => _localeIndex;

  Locale get locale {
    if (_localeIndex > 0) {
      var value = Constants.LocaleList[_localeIndex].split("-");
      return Locale(value[0], value.length == 2 ? value[1] : '');
    }
    // 跟随系统
    return null;
  }

  LocaleModel() {
    _localeIndex = Application.sp.getInt(Preference.SP_LOCALE_INDEX) ?? 0;
  }

  void updateLocaleIndex(int localeIndex) {
    this._localeIndex = localeIndex;
    notifyListeners();
    Application.sp.putInt(Preference.SP_LOCALE_INDEX, localeIndex);
  }

  static String localeName(index, context) {
    switch (index) {
      case 0:
        return S.of(context).autoBySystem;
      case 1:
        return '中文';
      case 2:
        return 'English';
      default:
        return '';
    }
  }
}
