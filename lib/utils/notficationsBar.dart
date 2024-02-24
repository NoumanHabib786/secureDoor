import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../resources/appColors.dart';
import '../resources/fonts.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void fieldFoucsChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
    );
  }

  static flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        flushbarStyle: FlushbarStyle.FLOATING,
        messageText: Text(
          message,
          style: MessageFonts.notifyW6(fontSize: 11.sp, color: Colors.white),
        ),
        borderRadius: BorderRadius.circular(12),
        padding: EdgeInsets.all(2.h),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
      )..show(context),
    );
  }

  static flushBarSuccessMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.easeOutExpo,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        flushbarStyle: FlushbarStyle.FLOATING,
        icon: const Icon(
          CupertinoIcons.checkmark_alt_circle_fill,
          color: Colors.white,
        ),
        messageText: Text(
          message,
          style: MessageFonts.notifyW6(fontSize: 11.sp, color: Colors.white),
        ),
        borderRadius: BorderRadius.circular(12),
        padding: EdgeInsets.all(2.h),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: AppColors.greenLight,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
      )..show(context),
    );
  }

  static launchProduct({required String url , required BuildContext context}) async {
    try {
      final Uri launchUri = Uri.parse(url);
      await launchUrl(launchUri);
    } catch (e) {
      print(e);

      Utils.flushBarErrorMessage("Invalid url", context);
    }
  }

  static launchPhoneMethod(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      await launchUrl(launchUri);
    } catch (e) {
      print(e);
    }
  }
}
