import 'package:flutter/material.dart';

import '../../../core/app_Color.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  static const String routeName = "Start Screen ";

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
   var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/image/Logo_app.png',
                width:size.width *0.6),
          ),
          Spacer(),
          SafeArea(
            bottom: true,
            child: Image.asset('assets/image/Logo2_app.png',
                width:size.width *0.4),
          )
        ],
      ),
    );
  }
}
