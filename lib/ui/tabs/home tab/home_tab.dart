import 'package:event_app/ui/tabs/home%20tab/home_header.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
return Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
HomeHeader()
  ],
);
  }
}
