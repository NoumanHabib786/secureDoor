import 'dart:ui';

import 'package:flutter/material.dart';

import 'color.dart';
import 'imagesPaths.dart';
const sizeHeight20 = SizedBox(height: 20,);
const sizeHeight15 = SizedBox(height: 15,);
const sizeHeight10 = SizedBox(height: 10,);
const sizeHeight5 = SizedBox(height: 5,);
const sizeHeight30 = SizedBox(height: 30,);
const sizeHeight40 = SizedBox(height: 40,);
const sizeHeight50 = SizedBox(height: 50,);
const sizeHeight60 = SizedBox(height: 60,);
const sizeHeight70 = SizedBox(height: 70,);
const sizeHeight80 = SizedBox(height: 80,);
const sizeWidth20 = SizedBox(width: 20,);
const sizeWidth10 = SizedBox(width: 10,);
const sizeWidth5 = SizedBox(width: 5,);
const sizeWidth30 = SizedBox(width: 30,);
const sizeWidth40 = SizedBox(width: 40,);
const sizeWidth50 = SizedBox(width: 50,);
const sizeWidth60 = SizedBox(width: 60,);
const sizeWidth70 = SizedBox(width: 70,);
const sizeWidth35 = SizedBox(width: 35,);
const sizeWidth15 = SizedBox(width: 15,);
 sizeStatusBar({required BuildContext context}){
   return SizedBox(height: MediaQuery.of(context).padding.top+10);
 }
// const dividerWhite = Divider(color: textColor,);
const divider = Divider();
const spacer = Spacer();
const kPaddingHorizontal20 = EdgeInsets.symmetric(horizontal: 20);
const kPaddingHorizontal10 = EdgeInsets.symmetric(horizontal: 10);
const kPaddingHorizontal30 = EdgeInsets.symmetric(horizontal: 30);
const kPaddingHorizontal40 = EdgeInsets.symmetric(horizontal: 40);
const kPaddingHorizontal60 = EdgeInsets.symmetric(horizontal: 60);
const kPaddingHorizontal80 = EdgeInsets.symmetric(horizontal: 80);
final kBorderRadius20 = BorderRadius.circular(20);
final kBorderRadius10 = BorderRadius.circular(10);

signupBackButton({context}){
  return GestureDetector(onTap: (){Navigator.pop(context);}, child: Image.asset(ImagesPaths.backIosIcon,width: 24,
    height: 24,));
}

showMyWaitingModal({required BuildContext context}){
  return  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(color: mainColor),
      );
    },
  );
}
backDropWithLoading({required BuildContext context}){
  final scrSize = MediaQuery.of(context).size;
  return  Container(
    height: scrSize.height,
    width: scrSize.width,
    child: Scaffold(
      backgroundColor: transparentColor,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 10,sigmaX: 10),
        child: Center(
          child: CircularProgressIndicator(
            color: mainColor,
          ),
        ),
      ),
    ),
  );
}


