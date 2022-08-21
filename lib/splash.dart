import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:swathyavardhak/login.dart';

import 'main.dart';

class Splash extends StatefulWidget {
const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

@override
Widget build(BuildContext context) {
return AnimatedSplashScreen(
  duration: 2000,
    backgroundColor: Color.fromRGBO(13, 15, 53, 90),
    splashIconSize: 330,
    splash: Container(
      child:   Image.asset(
        'images/swasthyas.png',),
    ),
    nextScreen: Mylogin());
}
}
