import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:event_app/core/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSwicth extends StatelessWidget {
  const LanguageSwicth({super.key});

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);
    return SizedBox(
      child: AnimatedToggleSwitch.rolling(
        height: 32,
          current:provider.locale,
          values: [
            'en',
            'ar'
          ],
        onChanged: (value){
          provider.changeLocal(value);
        },
        padding: EdgeInsets.zero,
        borderWidth: 1,
        style: ToggleStyle(
          indicatorColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.surface,
          borderColor: Theme.of(context).colorScheme.primary,
        ),
        indicatorSize: const Size.fromWidth(32),
        iconBuilder: (value , selected){
      if(value=="en"){
        return Image.asset('assets/image/LR.png ');
      }else{
        return Image.asset('assets/image/EG.png ');

      }
        },
      ),
    );
  }
}
