import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color blackColor = Color(0xff323232);
  static const Color text_black = Color(0xff000000);
  static const Color otherColor = Color(0xff97a2ac);
  static const Color greenColor = Color(0xff24f3d2);
  static const Color mainColor = Color(0xff175993);
  static const Color lightBlue = Color(0xffDCEEFF);
  static const Color asmaniColor = Color(0xff00CCBE);
  static const Color greenLight = Color(0xff71A84F);
  static const Color greyLight = Color(0xff979594);
  static const Color greenDark = Color(0xff3B6658);
  static const Color lightPink = Color(0xffFFDDBD);
  static const Color orangeDark = Color(0xffFF7C03);
  static const Color blue = Color(0xff3177B7);
  // static const Color blue = Color(0xffEDEDED);
  static const Color color1 = Color(0xffF7F1EF);
  static const Color lightBrown = Color(0xffC6B756);
  static const Color red = Color(0xFFFF4D4D);
  static const Color umer1 = Color(0xFFe6f0ff);
  static const Color umer2 = Color(0xFFd0ffd8);
  static const Color umer3 = Color(0xFFFEEEF8);
  static const Color umer4 = Color(0xFFf6e7FF);

}

class MainColor {
  static const MaterialColor maincolor = MaterialColor(_maincolorPrimaryValue, <int, Color>{
    50: Color(0xff175993),
    100: Color(0xff175993),
    200: Color(0xff175993),
    300: Color(0xff175993),
    400: Color(0xff175993),
    500: Color(_maincolorPrimaryValue),
    600: Color(0xff175993),
    700: Color(0xff175993),
    800: Color(0xff175993),
    900: Color(0xff175993),
  });
  static const int _maincolorPrimaryValue = 0xFF71A84F;

  static const MaterialColor maincolorAccent = MaterialColor(_maincolorAccentValue, <int, Color>{
    100: Color(0xFFD2FFBE),
    200: Color(_maincolorAccentValue),
    400: Color(0xFF8BFF58),
    700: Color(0xFF79FF3F),
  });
  static const int _maincolorAccentValue = 0xFFAEFF8B;
}
