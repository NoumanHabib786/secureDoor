import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../Screens/Enthusist/EnthuHomeScreen.dart';
import '../../Screens/Enthusist/workOut/workOutScreen.dart';
import '../../resources/fonts.dart';
import 'RoutesName.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
    // Main Screens Rotes
    // Splash Route
      case RoutesName.EnthuHomeScreen:
        return pageTransition(const EnthuHomeScreen());
      case RoutesName.WorkOutScreen:
        return pageTransition(const WorkOutScreen());

    // Default Route
      default:
        return PageTransition(
          duration: const Duration(milliseconds: 30),
          type: PageTransitionType.rightToLeft,
          child: Scaffold(
            body: Center(
              child: Text("No route defined", style: TextFonts.textW6()),
            ),
          ),
        );
    }
  }

  static PageTransition<dynamic> pageTransition(Widget next) {
    return PageTransition(
      duration: const Duration(milliseconds: 30),
      type: PageTransitionType.rightToLeft,
      child: next,
    );
  }
}
