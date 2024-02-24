import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../resources/appColors.dart';

Padding stepping(int index) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 2.h),
    child: Row(
      children: [
        CircleAvatar(
          radius: index >= 1 ? 0.7.h : 0.5.h,
          backgroundColor: AppColors.mainColor,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: index >= 1 ? AppColors.mainColor.withOpacity(0.7) : AppColors.mainColor.withOpacity(0.2),
              // boxShadow: [
              //   BoxShadow(
              //     color: AppColors.lightBlue,
              //     spreadRadius: 1,
              //
              //   )
              // ]
            ),
            height: 0.5.h,
          ),
        ),
        CircleAvatar(
          radius: index >= 1 ? 0.7.h : 0.5.h,
          backgroundColor: AppColors.mainColor,
        ),
        Expanded(
          child: Container(
            color: index >= 2 ? AppColors.mainColor.withOpacity(0.7) : AppColors.mainColor.withOpacity(0.2),
            height: 0.5.h,
          ),
        ),
        CircleAvatar(
          radius: index >= 2 ? 0.7.h : 0.5.h,
          backgroundColor: AppColors.mainColor,
        ),
      ],
    ),
  );
}