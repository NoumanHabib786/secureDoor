import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/resources/buttons.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';
import 'package:secure_fitness_comp/resources/sizedbox.dart';

dialogBox({context,content,contentPadding,ScrollPhysics? listViewScrollPhysics,BoxConstraints? dialogBoxConstraint}){
  return  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_){
        return WillPopScope(child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Dialog(
            // backgroundColor: ,
            insetPadding: EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.center,
            // actionsPadding: EdgeInsets.zero,
            // titlePadding: EdgeInsets.zero,
            // iconPadding: EdgeInsets.zero,
            // buttonPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: listViewScrollPhysics ?? AlwaysScrollableScrollPhysics(),
                  padding: contentPadding ?? EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  children: [
                    content,
                  ],
                ),
              ],
            ),
          ),
        ), onWillPop: ()async{
          return false;
        });
      });
}

CardWidget({elevation,BorderSide? borderSide,Color? bgColor,BorderRadius? borderRadius,required Widget content}){
  return Container(
    decoration: ShapeDecoration(
      color: bgColor?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        side: borderSide ?? BorderSide.none,
      ),
      shadows: [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 12,
          offset: Offset(0, 4),
          spreadRadius: 0,
        )
      ],
    ),
    // elevation: elevation ?? 0,
    // color: bgColor?? whiteColor,
    // margin: EdgeInsets.zero,
    // shape: RoundedRectangleBorder(
    //   borderRadius: borderRadius ?? BorderRadius.circular(10),
    // ),
    child: content,
  );
}

verificationDialogBox({context}){
  return dialogBox(
    context: context,
    content: Column(
      children: [
        Image.asset(ImagesPaths.verificationDialogMainIcon,width: 179.94,),
        sizeHeight30,
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Identity Verification',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              // height: 0,
            ),
          ),
        ),
        sizeHeight5,
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            // width: 243.30,
            // height: 14,
            child: Padding(
              padding: kPaddingHorizontal20,
              child: Text(
                'We need to verify your identity to help protect you from fraud and identity theft, and to comply with federal regulations.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  // height: 0,
                ),
              ),
            ),
          ),
        ),
        sizeHeight40,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          // width: scrSize.width*0.4,
          child: button(context: context,btnText: "Ok",onTap: (){
            // Navigator.pop(context);
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LetGetYouVerified()));
            // Navigator.push(context, MaterialPageRoute(builder: (context) => LetGetYouVerified()));
          },),
        ),
        sizeHeight20,
        TextButton(
            onPressed: (){
              Navigator.pop(context);
              // noInternetDialogBox(context: context);
              },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )),
        // sizeHeight15,
      ],
    ),
  );
}
