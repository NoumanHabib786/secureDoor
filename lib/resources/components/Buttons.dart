import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../appColors.dart';
import '../fonts.dart';

class ButtonsClass {
  static buildFillButton(
      {required BuildContext context,
      Function? function,
      String? btnName,
      Widget? widget,
      bool? isLoading,
      double? textSize,
      double? height,
      double? width,
      Color? btnColor}) {
    return isLoading == true
        ? Center(
            child: loading(),
          )
        : GestureDetector(
            onTap: () => function!(),
            child: Container(
              height: height ?? 40,
              width: width,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                  horizontal: 14.45, vertical: 10.84),
              decoration: ShapeDecoration(
                color: btnColor ?? const Color(0xFF71A84F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.03),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x23000000),
                    blurRadius: 5.42,
                    offset: Offset(0, 0.90),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: widget ??
                  Text(
                    btnName ?? 'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: textSize ?? 16,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
            ),
          );
  }

  static buildWidgetButton(
      {required BuildContext context,
      Function? function,
      Widget? widget,
      String? btnName,
      bool? isLoading,
      double? textSize,
      double? height,
      double? width,
      Color? btnColor}) {
    return isLoading == true
        ? loading()
        : GestureDetector(
            onTap: () => function!(),
            child: Container(
              height: height ?? 48,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                  horizontal: 14.45, vertical: 10.84),
              decoration: ShapeDecoration(
                color: btnColor ?? Color(0xFF71A84F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.03),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x23000000),
                    blurRadius: 5.42,
                    offset: Offset(0, 0.90),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: widget ??
                  Text(
                    btnName ?? 'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: textSize ?? 16,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
            ),
          );
  }

  static buildFillTextButton({
    required BuildContext context,
    Function? function,
    String? btnName,
    double? textSize,
    Color? textColor,
  }) {
    return TextButton(
        onPressed: () => function!(),
        child: Text(
          btnName ?? "View All",
          style: ButtonFonts.btnW6(
              fontSize: textSize ?? 10.sp,
              color: textColor ?? AppColors.mainColor),
        ));
  }

  static buildOutButton(
      {required BuildContext context,
      Function? function,
      String? btnName,
      double? textSize,
      Color? btnColor,
      bool? isLoading,
      Color? textColor}) {
    return SizedBox(
      width: 100.w,
      height: 6.h,
      child: isLoading == true
          ? loading()
          : ElevatedButton(
              onPressed: () => function!(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: btnColor ?? Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: AppColors.mainColor),
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                btnName ?? "Continue",
                style: ButtonFonts.btnW5(
                    color: textColor ?? Colors.black,
                    fontSize: textSize ?? 12.sp),
              )),
    );
  }

  static bottomSheet({Widget? child}) {
    return Container(
      padding: EdgeInsets.all(2.h),
      color: Colors.white,
      child: child,
    );
  }
}

loading() {
  return Center(
    child: CircularProgressIndicator()
  );
}
