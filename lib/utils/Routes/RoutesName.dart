import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutesName {


  // Main Screens Name
  static const String splashScreen = 'splashScreen';
  static const String homeScreen = 'homeScreen';


//-------Enthusist-Screens
  static const String EnthuHomeScreen = 'EnthuHomeScreen';
  static const String WorkOutScreen = 'WorkOutScreen';

  // PUSH METHOD

  static push(BuildContext context, String route) {
    return Navigator.pushNamed(context, route);
  }
  static push2(BuildContext context, Widget route) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) =>  route,));
  }

  // REPLACE METHOD

  static replace(BuildContext context, String route) {
    return Navigator.pushReplacementNamed(context, route);
  }

  // REMOVE METHOD

  static remove(BuildContext context, String route) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      route,
          (route) => false,
    );
  }

  static remove2(BuildContext context, Widget route) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => route,),
          (route) => false,
    );
  }

}
