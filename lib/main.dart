import 'package:contact_app/home_screen.dart';
import 'package:contact_app/wellcome_screen.dart';
import 'package:flutter/material.dart';

main(){
  runApp(Contactapp());
}
class Contactapp extends StatelessWidget {
  const Contactapp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        WellcomeScreen.RouteName:(context)=>WellcomeScreen(),
        HomeScreen.RouteName:(context)=>HomeScreen(),
      },
      initialRoute: WellcomeScreen.RouteName,
    );
  }
}
