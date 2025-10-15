import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
ThemeMode appTheme = ThemeMode.light;

void changeTheme(ThemeMode nemTheme){
if(nemTheme == appTheme) return;
appTheme = nemTheme;
notifyListeners();
}

bool isDark(){
  return appTheme == ThemeMode.dark;
}
}
