import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';

import '../AuthScreen/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AnimatedSplashScreen(
          nextScreen: OnBoarding(),
          splash: ImagesPaths.logoIcon,
        ));
  }
}
