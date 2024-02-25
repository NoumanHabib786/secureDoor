import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/Screens/AuthScreen/Signup/step_three_email_verify.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';

import '../../Provider/auth_provider.dart';
import '../../models/enthusistModel.dart';
import '../../utils/Routes/RoutesName.dart';
import '../../utils/notficationsBar.dart';
import '../AuthScreen/Signup/age_height_weigth_info.dart';
import '../AuthScreen/Signup/bodyType_level.dart';
import '../AuthScreen/Signup/professional_signup.dart';
import '../AuthScreen/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  fetch() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var auths = Provider.of<AuthenProvider>(context, listen: false);
      if (FirebaseAuth.instance.currentUser != null) {
        if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
          await FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .get()
              .then((value) {
            {
              print(value['accountType']);
              if (value.exists == false) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AgeHeightWeightInfo()),
                    (route) => false);
              } else {
                if (value['accountType'] == 'Enthusiast') {
                  print(value.data());
                  Map data = {};
                  auths.enthusistModel = EnthusistModel.fromJson(value.data()!);
                  setState(() {});
                  RoutesName.remove(context, RoutesName.EnthuHomeScreen);
                } else {
                  if (value.get("name") == null ||
                      value.get("name").toString().isEmpty) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgeHeightWeightInfo()),
                        (route) => false);
                  } else if (value.get("accountType") == "Professional" &&
                          value.get("profileImage") == null ||
                      value.get("profileImage").toString().isEmpty) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfessionalSignupScreen()),
                        (route) => false);
                  } else if (value.get("accountType") == "Enthusiast") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BodyTypeAndWorkoutLevel()),
                    );
                  }
                }
              }
            }
          }).onError((error, stackTrace) {
            print(error);
            RoutesName.remove2(context, AgeHeightWeightInfo());
          });
        } else {
          RoutesName.remove2(context, SignupStepThreeEmailVerify());
        }
      } else {
        print("object");
        RoutesName.push2(context, OnBoarding());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AnimatedSplashScreen(
      nextScreen: SizedBox(),
      splash: ImagesPaths.logoIcon,
    ));
  }
}
