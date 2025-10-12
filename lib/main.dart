import 'package:event_app/ui/Screens/setup/setup_Screen.dart';
import 'package:event_app/ui/Screens/start/start_Screen.dart';
import 'package:flutter/material.dart';

import 'core/app_theme.dart';

void main(){
  runApp(eventApp());
}
class eventApp extends StatelessWidget {
  const eventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        StartScreen.routeName :(context)=> StartScreen(),
        // InfoScreen.routeName :(context)=> InfoScreen(),
        SetupScreen.routeName :(context)=> SetupScreen(),
        // HomeScreen.routeName :(context)=> HomeScreen(),
      },

      // initialRoute: StartScreen.routeName,
    );;
  }
}
