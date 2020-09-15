import 'package:flutter/material.dart';
import 'package:flutter_yome/utils/sp_util.dart';

import 'package:flutter_yome/application.dart';

class FontModel with ChangeNotifier {
  int _fontIndex;

  get fontIndex => _fontIndex;

  void updateFontIndex(int fontIndex) {
    this._fontIndex = fontIndex;
    notifyListeners();
    Application.sp.putInt(Preference.SP_FONT_INDEX, fontIndex);
  }
}
