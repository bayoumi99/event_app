import 'package:event_app/ui/Screens/login_screen/Login_screen.dart';
import 'package:event_app/ui/Widgets/Theme_switch.dart';
import 'package:event_app/ui/Widgets/language_swicth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/app_config_provider.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});
  static const String routeName = "Info Screen ";

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                  child: Image.asset('assets/image/Group 4.png',width: MediaQuery.sizeOf(context).width*0.4)),
              Expanded(child:
              Image.asset('assets/image/${provider.isDark()?"Group.png":"being-creative.png"}',),),

              Text('Personalize Your Experience',style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 8,),
              Text("Choose your preferred theme and language to get started with a comfortable,"
                  " tailored experience that suits your style.",style: Theme.of(context).textTheme.bodyLarge,),
              Row(
                children: [
                  Text('language',style: Theme.of(context).textTheme.titleLarge,),
                    Spacer(),
                    LanguageSwicth(),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text('theme',style: Theme.of(context).textTheme.titleLarge,),
                  Spacer(),
                  ThemeSwitch()
                ],
              ),
              SizedBox(height: 8,),
              FilledButton(onPressed: (){
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Let's Go ")
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
