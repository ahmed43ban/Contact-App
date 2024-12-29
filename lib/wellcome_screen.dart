import 'package:contact_app/home_screen.dart';
import 'package:flutter/material.dart';

class WellcomeScreen extends StatelessWidget {
  static const String RouteName = 'wellcome';
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, HomeScreen.RouteName);});
    return Scaffold(
      backgroundColor: Color(0xff29384D),
      body: Column(
        children: [
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Group 5.png"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
