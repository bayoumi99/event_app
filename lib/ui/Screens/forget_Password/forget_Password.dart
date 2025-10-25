import 'package:event_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  static const String routeName = "Forget Password ";

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.resetPassword)
      ),
      body:  ListView(
         padding: EdgeInsets.all(16),
        children: [
          Image.asset("assets/image/change-setting.png"),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value){
              value = value??"";
              if(value.isEmpty){
                return "Email is required";
              }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                return"Email is not valid";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: local?.email,
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 16,),
          FilledButton(onPressed: (){
            if(emailController.text.isEmpty ){
             emailController.text;
            }
          }, child:
          Text(AppLocalizations.of(context)!.resetPassword))

          ],

    )
     );
  }
}
