import 'package:event_app/ui/Screens/forget_Password/forget_Password.dart';
import 'package:event_app/ui/Screens/home/home_Screen.dart';
import 'package:event_app/ui/Widgets/language_swicth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});
   static const String routeName = "login Screen ";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   TextEditingController emailController = TextEditingController();

   TextEditingController passwordController = TextEditingController();

   ValueNotifier<bool> passwordVisible = ValueNotifier(false);

   GlobalKey<FormState> formKey = GlobalKey<FormState>();

   ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context);
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset('assets/image/Logo_app.png',
                    width:size.width *0.4)
            ),
            SizedBox(height: 16,),
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
            ValueListenableBuilder(
              valueListenable: passwordVisible,
              builder: (context, value, child) => TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value){
                  value = value??"";
                  if(value.isEmpty){
                    return "password is required";
                  }else if(!RegExp( r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                    return"password is not valid";
                  }
                  return null;
                },
                obscureText: !value,
                obscuringCharacter: "#",
                decoration: InputDecoration(
                  hintText: local?.password,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                      onTap: (){
                        passwordVisible.value = !passwordVisible.value;
                      },
                      child: Icon(value ? Icons.visibility: Icons.visibility_off)),
                ),
              ),
            ),
            SizedBox(height: 16,),
            Align(
          alignment: Alignment.centerLeft,
          child: TextButton(onPressed:(){
            Navigator.of(context).pushNamed(ForgetPassword.routeName);
          },

        child: Text(local!.forgetPassword)
          ),
        ),
            SizedBox(height: 16,),
            ValueListenableBuilder(
              valueListenable: isLoading,
              builder: (context, value, child) =>  FilledButton(onPressed: ()async{
                if(formKey.currentState!.validate())  {
                  isLoading.value = true;
                  try{
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text
                );
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  }catch(e){
                  print(e);
                  }finally{
                    isLoading.value = false;
                  }
                }
              }, child:value ? CircularProgressIndicator(
                color: Theme.of(context).colorScheme.surface,
              ) : Text(local.login)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(local.doNotHaveAccount),
                TextButton(onPressed: (){
                  Navigator.of(context).pushNamed(RegisterScreen.routeName);

                }, child: Text(local.createAccount))
              ],
            ),
            Row(
              children: [
                Expanded(child: Divider(
                  indent: 40,
                )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(local.or ,style: Theme.of(context).textTheme.titleLarge,),
                ),
                Expanded(child: Divider(endIndent: 40,)),

              ],
            ),
            OutlinedButton.icon(onPressed: (){},
            icon:  Image.asset('assets/image/google.png',),
                label: Row(
              children: [
                Text(local.loginWithGoogle),
              ],
            )),
            Align(
                alignment: Alignment.center,
                child: LanguageSwicth()),
          ]
        ),
      )
    );
  }
}
