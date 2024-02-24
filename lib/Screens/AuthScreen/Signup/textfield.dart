// import 'package:flutter/material.dart';
//
// import '../../../resources/color.dart';
// import '../../../resources/sizedbox.dart';
//
//
// signupTextField({BoxConstraints? suffixConstrains,Color? lineColor,void Function(String)? onChanged,String? Function(String?)? validator,bool? isReadBool,String? hintText,keyboardType,String? title,String?leadImagePath,Widget?suffixIcon,TextEditingController? controller, obscureTextBool}){
//   return Row(
//     children: [
//       CircleAvatar(
//         backgroundColor: whiteColor,
//         radius: 25,
//         child: Image.asset(leadImagePath??mailIcon,height: 24,width: 24,),
//       ),
//       sizeWidth10,
//       Expanded(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title??'',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   // fontFamily: 'Roboto',
//                   fontWeight: FontWeight.w500,
//                   height: 0,
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//                 // color: Colors.green,
//                 child: TextFormField(
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     // height: 0,
//                   ),
//                   cursorColor: mainColor,
//                   readOnly: isReadBool ?? false,
//                   // style: TextStyle(
//                   controller: controller,
//                   // height: -0.1
//                   // ),
//                   // maxLength:8
//                   validator: validator,
//                   onChanged: onChanged,
//                   obscureText: obscureTextBool ?? false,
//                   keyboardType: keyboardType ?? TextInputType.name,
//                   decoration: InputDecoration(
//                     suffixIcon: suffixIcon ?? SizedBox(),
//                     suffixIconConstraints: suffixConstrains,
//                     contentPadding: EdgeInsets.symmetric(vertical: -4),
//                     hintText: hintText ??"",
//                     hintStyle: TextStyle(
//                       color: Color(0xFF97A2AC),
//                       fontSize: 12,
//                       // fontFamily: 'Roboto',
//                       fontWeight: FontWeight.w400,
//                       height: 0,
//                     ),
//                     border: InputBorder.none,
//                     errorBorder: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     // : InputBorder.none,
//                     // ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//       sizeWidth10,
//       Transform(
//         transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
//         child: Container(
//           width: 29.62,
//           decoration: ShapeDecoration(
//             shape: RoundedRectangleBorder(
//               side: BorderSide(
//                 width: 1,
//                 // strokeAlign: BorderSide.strokeAlignCenter,
//                 color:lineColor ?? Color(0xFF97A2AC),
//               ),
//             ),
//           ),
//         ),
//       )
//     ],
//   );
// }
// textFieldDecoration ({String? hintText ,Widget? suffixIcon}){
//   return InputDecoration(
//     contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
//     hintText: hintText ?? "",
//
//     filled: true,
//     fillColor: transparentColor,
//     hintStyle: TextStyle(
//       color: otherColor,
//       // fontWeight: FontWeight.w300,
//       fontSize: 12,
//
//     ),
//     border: OutlineInputBorder(
//       borderRadius: kBorderRadius10,
//       borderSide: const BorderSide(color: otherColor,width: 0.2),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: kBorderRadius10,
//       borderSide: const BorderSide(color: otherColor,width: 0.2),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: kBorderRadius10,
//       borderSide: const BorderSide(color: otherColor,width: 0.2),
//     ),
//     suffixIcon: suffixIcon?? Container(),
//   );
// }
// textFieldDecorationNoBorder ({EdgeInsets? contentPadding,TextStyle? hintStyle,String? hintText ,Widget? suffixIcon}){
//   return InputDecoration(
//     contentPadding:contentPadding ?? EdgeInsets.symmetric(vertical:3),
//     isDense: true,
//     hintText: hintText,
//
//     suffixIcon: suffixIcon?? SizedBox(),
//     hintStyle: TextStyle(
//       color: Colors.grey,
//       fontSize: 12,
//       // fontFamily: 'Roboto',
//       fontWeight: FontWeight.w400,
//       height: 0,
//     ),
//
//     border: InputBorder.none,
//     errorBorder: InputBorder.none,
//     enabledBorder: InputBorder.none,
//   );
// }
//
// InputDecoration textFieldDecorationJustRightSideIcon ({required String iconPath,}){
//   return InputDecoration(
//       contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
//       // hintText: "Phone number",
//       hintStyle: txtStyle12,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(13),
//         borderSide: BorderSide(
//           width: 1.0,
//           color: textColor,
//         ),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(13),
//         borderSide: BorderSide(
//             color: textColor,
//             width: 1.0
//         ),
//       ),
//       suffixIconConstraints: BoxConstraints(
//         maxWidth: 40,
//         minWidth: 40,
//         maxHeight: 40,
//         minHeight: 40,
//       ),
//       suffixIcon: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Image.asset( iconPath ,width: 20,color: textColor,),
//       )
//   );
// }
// InputDecoration textFieldDecorationNoIcon (){
//   return InputDecoration(
//       contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
//       // hintText: "Phone number"
//       hintStyle: txtStyle12,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(13),
//         borderSide: BorderSide(
//           width: 1.0,
//           color: textColor,
//         ),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(13),
//         borderSide: BorderSide(
//             color: textColor,
//             width: 1.0
//         ),
//       ),
//   );
// }