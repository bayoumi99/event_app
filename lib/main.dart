import 'package:event_app/core/provider/app_config_provider.dart';
import 'package:event_app/firebase_options.dart';
import 'package:event_app/ui/Screens/forget_Password/forget_Password.dart';
import 'package:event_app/ui/Screens/home/home_Screen.dart';
import 'package:event_app/ui/Screens/login_screen/Login_screen.dart';
import 'package:event_app/ui/Screens/register/register_screen.dart';
import 'package:event_app/ui/Screens/setup/setup_Screen.dart';
import 'package:event_app/ui/Screens/start/start_Screen.dart';
import 'package:event_app/ui/mange%20event/mange_event.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/Theme/app_theme.dart';
import 'l10n/generated/app_localizations.dart';
// import 'provider/app_config_provider.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.locale),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: provider.appTheme,
        routes: {
           StartScreen.routeName: (context) => StartScreen(),
          // InfoScreen.routeName :(context)=> InfoScreen(),
           SetupScreen.routeName: (context) => SetupScreen(),
           LoginScreen.routeName: (context) => LoginScreen(),
           RegisterScreen.routeName: (context) => RegisterScreen(),
           HomeScreen.routeName :(context)=> HomeScreen(),
           ForgetPassword.routeName: (context) => ForgetPassword(),
           MangeEvent.routeName: (context) => MangeEvent(),
        },

        initialRoute: StartScreen.routeName,
      );
      }
      );
  }
}
