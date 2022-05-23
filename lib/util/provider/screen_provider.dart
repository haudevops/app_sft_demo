import 'package:flutter/material.dart';

import '../../page/home/home_page.dart';
import '../../page/setting/setting_page.dart';
import '../../routes/screen_argument.dart';

class ScreenProvider extends ChangeNotifier {
  int _currentTab = 0;
  List<Widget> _screen = [
    HomePage(),
    SettingPage(
      data: ScreenArguments(),
    ),
  ];

  set currentTab(tab) {
    this._currentTab = tab;
    notifyListeners();
  }

  get currentTab => this._currentTab;
  get currentScreen => this._screen[this._currentTab];
}
