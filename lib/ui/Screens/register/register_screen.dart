import 'package:event_app/fireBase/fireBase_auth_servces.dart';
import 'package:flutter/material.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../Widgets/language_swicth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "Register Screen ";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  ValueNotifier<bool> passwordVisible = ValueNotifier(false);
  ValueNotifier<bool> rePasswordVisible = ValueNotifier(false);
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text(locale!.registerTitle)
    ),
        body: Form(
          key: formKey,
          child: ListView(
              padding: EdgeInsets.all(16),
              children: [
              Align(
              alignment: Alignment.center,
              child: Image.asset('assets/image/Logo_app.png',
              width:size.width *0.3)
              ),
                SizedBox(height: 8),
                TextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value){
            value = value??"";
            if(value.isEmpty){
              return "user name is required";
            }else if(!RegExp(r"^[a-zA-Z0-9_-_ ]{3,20}").hasMatch(value)){
              return"user name is not valid";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: locale.nameHint,
            prefixIcon: Icon(Icons.person),
          ),
                ),
                SizedBox(height: 8),
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
            hintText: locale.email,
            prefixIcon: Icon(Icons.email),
          ),
                ),
                SizedBox(height: 8,),
          
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
              hintText: locale.password,
              prefixIcon: Icon(Icons.lock),
              suffixIcon: InkWell(
                  onTap: (){
                    setState(() {
                      value = !value ;
                    });
                  },
                  child: Icon(value ? Icons.visibility: Icons.visibility_off)),
            ),
          ),
                ),
                SizedBox(height: 8,),
                ValueListenableBuilder(
          valueListenable: rePasswordVisible,
          builder: (context, value, child) => TextFormField(
            controller: rePasswordController,
            keyboardType: TextInputType.visiblePassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value){
              value = value??"";
              if(value.isEmpty){
                return "rePassword is required";
              }else if(!RegExp( r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                return"rePassword is not valid";
              }
              return null;
            },
            obscureText: !value,
            obscuringCharacter: "#",
            decoration: InputDecoration(
              hintText: locale.rePasswordHint, 
              prefixIcon: Icon(Icons.lock),
              suffixIcon:  InkWell(
                  onTap: (){
                    setState(() {
                      value = !value ;
                    });
                  },
                  child: Icon(value ? Icons.visibility: Icons.visibility_off)),
            ),
          ),
                ),
                SizedBox(height: 8,),
                ValueListenableBuilder(
                  valueListenable: isLoading,
                  builder: (context, value, child) => FilledButton(
                      onPressed: () async{
                    if(formKey.currentState!.validate()){
                      isLoading.value = true;
                      try{
                       await FirebaseAuthServces().registerUser(
                            nameController.text,
                            emailController.text,
                            passwordController.text
                        );
                      Navigator.pop(context);
                      }catch(e){
                        print(e);
                      }finally{
                        isLoading.value = false;
                      }
                    }
                  }, child:value? CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.surface,
                  ): Text(locale.createAccount)),
                ),
                Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locale.alreadyHaveAccount),
            TextButton(onPressed: (){}, child: Text(locale.login))
          ],
                ),
                Align(
            alignment: Alignment.center,
            child: LanguageSwicth()),
          
          
              ]
          
              ),
        )
    );
  }
}
