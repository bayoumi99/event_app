import 'package:event_app/core/provider/app_config_provider.dart';
import 'package:event_app/ui/Screens/login_screen/Login_screen.dart';
import 'package:event_app/ui/Screens/setup/setup_Screen.dart';
import 'package:event_app/ui/Screens/start/start_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/Theme/app_theme.dart';

void main(){
  runApp(eventApp());
}
class eventApp extends StatelessWidget {
  const eventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create :(context)=> AppConfigProvider(),
      builder:(context ,child){
        var provider = Provider.of<AppConfigProvider>(context);
      return MaterialApp(
        // localizationsDelegates: AppLocalizations.localizationsDelegates,
        // supportedLocales: AppLocalizations.supportedLocales,
        // locale: locale("en"),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: provider.appTheme,
        routes: {
          StartScreen.routeName: (context) => StartScreen(),
          // InfoScreen.routeName :(context)=> InfoScreen(),
          SetupScreen.routeName: (context) => SetupScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),

          // HomeScreen.routeName :(context)=> HomeScreen(),
        },

        initialRoute: StartScreen.routeName,
      );
      }
      );
  }
}
