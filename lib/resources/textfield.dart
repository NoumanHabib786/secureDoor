import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secure_fitness_comp/resources/appColors.dart';
import 'package:secure_fitness_comp/resources/sizedbox.dart';
import 'package:secure_fitness_comp/resources/textStyle.dart';

textField({
  TextEditingController? controller,
  TextInputType? keyboardType,
  Function(String)? onChanged,
  Function()? onTap,
  List<TextInputFormatter>? inputFormatters,
  String? hintText,
  EdgeInsets? padding,
  bool? isReadBool,
  int? maxLine,
  Widget? suffixIcon,
  String? Function(String?)? validator
}){
  return TextFormField(
    controller: controller,
    cursorColor: AppColors.mainColor,
    maxLines: maxLine,
    readOnly: isReadBool ?? false,
    inputFormatters: inputFormatters,
    style: txtStyle14AndBlack,
    validator: validator,
    keyboardType: keyboardType,
    onChanged: onChanged,
    onTap: onTap,
    decoration: InputDecoration(
      contentPadding: padding ?? const EdgeInsets.symmetric(
          vertical: 0, horizontal: 10),
      hintText: hintText,

      suffixIcon: suffixIcon ?? SizedBox(),
      hintStyle: txtStyle12AndOther,
      border: OutlineInputBorder(
        borderRadius: kBorderRadius10,
        borderSide: BorderSide(
            color: AppColors.otherColor, width: 0.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: kBorderRadius10,
        borderSide:  BorderSide(
            color: AppColors.otherColor, width: 0.2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: kBorderRadius10,
        borderSide: BorderSide(
            color: AppColors.otherColor, width: 0.2),
      ),
      // suffixIcon: suffixIcon?? Container(),
    ),
  );
}