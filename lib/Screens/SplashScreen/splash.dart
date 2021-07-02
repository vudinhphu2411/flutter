import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app/Screens/QuestionScreen/question1/question1.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
            'assets/images/moon.png'
        ),
        splashIconSize: 400,
        nextScreen: Question1(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.black,
      )
    );
  }
}