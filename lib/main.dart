import 'package:flutter/material.dart';
import 'package:razor_pay_app/homepage.dart';
import 'package:razor_pay_app/loginpage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Razor Pay',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
        
      ),
      home:Scaffold(
        backgroundColor: Colors.blueAccent,

        body: AnimatedSplashScreen(
          splash:Image.asset("android/Assests/Images/twitter.png") ,
          nextScreen: const HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          duration:3000,
        ) ,
      )
     
     
    );
  }
}
