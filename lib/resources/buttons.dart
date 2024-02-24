import 'package:flutter/material.dart';
import 'package:secure_fitness_comp/resources/appColors.dart';
import 'package:secure_fitness_comp/resources/sizedbox.dart';
import 'package:secure_fitness_comp/resources/textStyle.dart';

button({BorderSide? borderSide,Color? foreground,BorderRadius? borderRadius,required BuildContext context,Function()? onTap,String? btnText,Color? bgColor,Color? btnTextColor,TextStyle? btnTextStyle}){
  final scrSize = MediaQuery.of(context).size;
  return SizedBox(
    width: double.maxFinite,
    height: 50,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: bgColor ?? Color(0xFF175993),
          foregroundColor: foreground ?? Color(0xFF175993),
          // foregroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            side: borderSide ?? BorderSide.none,
          ),
        ),
        onPressed: onTap,
        child: Text(
         btnText ?? '',
          style: btnTextStyle ?? TextStyle(
            color: btnTextColor ?? Colors.white,
            fontSize: 12,
            // fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        )),
  );
}

iconButton({
  BorderSide? borderSide,
  EdgeInsets? textPadding,MainAxisAlignment? mainAxisAlignment,Widget? rightSideIcon,Color? bgColor,BorderRadius? borderRadius,TextStyle? textStyle,required BuildContext context,required Function() onTap,Widget? icon,String? btnText}){
  final scrSize = MediaQuery.of(context).size;
  return SizedBox(
    height: 45,
    width: scrSize.width,
    child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          // foregroundColor: mainColor,
          padding: EdgeInsets.zero,
          shadowColor: Colors.transparent,
          backgroundColor:bgColor ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? kBorderRadius10,
            side: borderSide ??  BorderSide(color: AppColors.otherColor,width: 0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          children: [
            rightSideIcon !=null? SizedBox(height: 30,) : Container(),
            icon ?? Container(),
           icon == null? Container() : const SizedBox(width: 10,),
            Padding(
              padding: textPadding ?? EdgeInsets.zero,
              child: Text(btnText ?? "",maxLines: 1,overflow: TextOverflow.ellipsis,style: textStyle ?? txtStyle12AndBold,),
            ),
            rightSideIcon !=null? SizedBox(
                height: 40,
                child: rightSideIcon ) : Container(),
          ],
        )),
  );
}
