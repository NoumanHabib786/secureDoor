import 'package:secure_fitness_comp/resources/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../fonts.dart';

AppBar app_bar(
    {required BuildContext context,
    required String title,
    bool? isCenter,
    bool? isAuto,
    Color? txtColor,
    Widget? withoutLeading,
    Widget? action}) {
  return AppBar(
    centerTitle: isCenter ?? true,
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: isAuto ?? false,
    title: Text(
      title,
      style: TextFonts.textW8(fontSize: 12.sp, color: txtColor ?? Colors.black),
    ),
    leading: isAuto == true
        ? InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.left_chevron,
              size: 2.5.h,
              color: AppColors.mainColor,
            ),
          )
        : withoutLeading ?? Container(),
    actions: [action ?? Container()],
  );
}
