import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MessageFonts {
  static TextStyle notifySimple(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 10.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
    );
  }

  static TextStyle notifyW5(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 12.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  static TextStyle notifyW6(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 12.sp,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? Colors.black,
    );
  }

  static TextStyle notifyW7(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 15.sp,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? Colors.black,
    );
  }

  static TextStyle notifyW8(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return GoogleFonts.poppins(
      fontSize: fontSize ?? 16.sp,
      fontWeight: fontWeight ?? FontWeight.w800,
      color: color ?? Colors.black,
    );
  }
}

class ButtonFonts {
  static TextStyle btnSimple(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: fontSize??10.sp,
      fontFamily: 'avenir',
      fontWeight:fontWeight?? FontWeight.normal,
    );
  }

  static TextStyle btnW5(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: fontSize??11.sp,
      fontFamily: 'avenir',
      fontWeight:fontWeight?? FontWeight.w500,
    );
  }

  static TextStyle btnW6(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: fontSize??12.sp,
      fontFamily: 'avenir',
      fontWeight:fontWeight?? FontWeight.w600,
    );
  }

  static TextStyle btnW7(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: fontSize??15.sp,
      fontFamily: 'avenir',
      fontWeight:fontWeight?? FontWeight.w700,
    );
  }

  static TextStyle btnW8(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: fontSize??16.sp,
      fontFamily: 'avenir',
      fontWeight:fontWeight?? FontWeight.w800,
    );
  }
}
class TextFonts {
  static TextStyle textSimple(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize??10.sp,
      fontFamily: 'avenir',
      fontWeight:fontWeight?? FontWeight.normal,
    );
  }

  static TextStyle textW5(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize??12.sp,
      fontFamily: 'avenir',
      fontWeight:fontWeight?? FontWeight.w500,
    );
  }

  static TextStyle textW6(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize??12.sp,
      fontFamily: 'avenir',
      fontWeight:fontWeight?? FontWeight.w600,
    );
  }

  static TextStyle textW7(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize??15.sp,
      fontFamily: 'avenir',
      fontWeight:fontWeight?? FontWeight.w700,
    );
  }

  static TextStyle textW8(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize??18.sp,
      fontFamily: 'avenir',
      fontWeight:fontWeight?? FontWeight.w800,
    );
  }
}
