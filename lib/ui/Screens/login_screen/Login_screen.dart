import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = "login Screen ";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset('assets/image/Logo_app.png',  width:size.width *0.6))
        ]
      )
    );
  }
}
