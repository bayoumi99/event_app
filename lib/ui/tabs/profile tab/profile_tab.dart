
import 'package:event_app/core/provider/app_config_provider.dart';
import 'package:event_app/fireBase/fireBase_auth_servces.dart';
import 'package:event_app/ui/Screens/login_screen/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/Theme/app_Color.dart';
import '../../../l10n/generated/app_localizations.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Expanded(
            child: ListView(
                padding: EdgeInsets.zero,
                children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                    ),

                  ),
                  child: SafeArea(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(50),
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            color:AppColor.lightBlue ,
                          ),
                          child: SizedBox(
                            width: 80,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset("assets/image/Logo_app.png"
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(FirebaseAuthServces().getUserData()?.displayName??"",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,)
                               ),
                              Text(FirebaseAuthServces().getUserData()?.email??"",
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Theme.of(context).colorScheme.onPrimary,)
                              ),

                            ],
                          ),
                        )


                        ],
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(AppLocalizations.of(context)!.language ,),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )
                      ,borderRadius: BorderRadius.circular(16),

                    ),
                    child: DropdownButton<String>(
                       items:
                       ["en","ar"].map((e)=>DropdownMenuItem<String>(
                         value: e,
                        child: Text(e),
                      )).toList(),
                      onChanged: (e){
                         provider.changeLocal(e ??"en");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(AppLocalizations.of(context)!.theme ,),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )
                          ,borderRadius: BorderRadius.circular(16),

                    ),
                    child: DropdownButton<ThemeMode>(
                      value: provider.appTheme,
                      isExpanded: true,
                      underline: SizedBox(),

                      items:
                      [ThemeMode.light,ThemeMode.dark,]
                          .map((e)=>DropdownMenuItem<ThemeMode>(
                        value: e,
                        child: Text(e.toString()),
                      )).toList(),
                      onChanged: (e){
                        provider.changeTheme(e ??ThemeMode.dark);
                      },
                    ),
                  )



              ]
            ),
          ),
          SizedBox(height: 16,),
          FilledButton(onPressed: ()async{
            try{
             await FirebaseAuthServces().logout();
             Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            }catch(e){
              print(e.toString());
            }
          },
              style: FilledButton.styleFrom(
                backgroundColor:Colors.red,
              ),
              child:
              Row(
                children: [
                  Expanded(child: Text("log out")),
                  Icon(Icons.logout),
                ],
              )
          )
        ],
      ),
    );
  }
}
