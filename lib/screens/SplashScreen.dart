import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:link_download_video/screens/HomeScreen.dart';
import 'package:page_transition/page_transition.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

}


class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/logo/app.png',
      nextScreen: HomeScreen(),
      duration: 3,
      backgroundColor: Colors.white,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType:  PageTransitionType.leftToRight,
    );
  }
}
