// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../Provider/auth_provider.dart';
// import '../../../resources/buttons.dart';
// import '../../../resources/sizedbox.dart';
//
// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({Key? key}) : super(key: key);
//
//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }
//
// class _ForgotPasswordState extends State<ForgotPassword> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       final provider = Provider.of<AuthenProvider>(context,listen: false);
//       // provider.emailControllerForForgotPassword.clear();
//       // provider.loginScreenEmailValidationCheckFun(value: AllValidation.isEmailValid(""));
//
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AuthenProvider>(
//         builder: (context,provider,_){
//           return  Scaffold(
//             resizeToAvoidBottomInset: false,
//             body: SingleChildScrollView(
//               child: Padding(
//                 padding: kPaddingHorizontal20,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     sizeStatusBar(context: context),
//                     sizeHeight30,
//                     Text(
//                       'Forgot password',
//                       style: TextStyle(
//                         color: textColor,
//                         fontSize: 24,
//                         // fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w700,
//                         height: 0,
//                       ),
//                     ),
//                     sizeHeight10,
//                     Text(
//                       'Enter your email to receive a password reset link.',
//                       style: TextStyle(
//                         color: otherColor,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         height: 0,
//                       ),
//                     ),
//                     sizeHeight60,
//                     ///Email
//                     signupTextField(
//                         hintText: "Enter your email.",
//                         title: "Email",
//                         controller: provider.emailControllerForForgotPassword,
//                         keyboardType: TextInputType.emailAddress,
//                         leadImagePath: mailIcon,
//                         onChanged: (e){
//                           provider.loginScreenEmailValidationCheckFun(value: AllValidation.isEmailValid(e));
//                           print("check -> ${provider.loginScreenEmailValidationCheckBool}");
//                         }
//                     ),
//                     provider.emailControllerForForgotPassword.text.isEmpty?  SizedBox() : provider.loginScreenEmailValidationCheckBool == false? Container(
//                       // margin: EdgeInsets.only(top: 4),
//                       child: Row(
//                         children: [
//                           sizeWidth60,
//                           Text(
//                             '*Please enter valid email',
//                             style: TextStyle(
//                               color: Color(0xFFFD593E),
//                               fontSize: 9,
//                               fontWeight: FontWeight.w400,
//                               height: 0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ) : SizedBox(),
//                     sizeHeight60,
//                     ///Button
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 30),
//                       child: button(
//                         context: context,
//                         onTap: ()async{
//                           // await provider.sendPasswordResetEmail(provider.emailControllerForForgotPassword.text).whenComplete(() {
//                           //   dialogBox(
//                           //     context: context,
//                           //     content: Column(
//                           //       children: [
//                           //         Image.asset(forgotPasswordDialogIcon,width: 36,
//                           //           height: 36,),
//                           //         sizeHeight30,
//                           //         Align(
//                           //           alignment: Alignment.topCenter,
//                           //           child: Text(
//                           //             'Password Request Sent!',
//                           //             style: TextStyle(
//                           //               color: Colors.black,
//                           //               fontSize: 20,
//                           //               fontWeight: FontWeight.w700,
//                           //               // height: 0,
//                           //             ),
//                           //           ),
//                           //         ),
//                           //         sizeHeight5,
//                           //         Align(
//                           //           alignment: Alignment.topCenter,
//                           //           child: SizedBox(
//                           //             // width: 243.30,
//                           //             // height: 14,
//                           //             child: Text(
//                           //               'If you have an account with us, you will receive an \nemail with the instructions on what to do next.',
//                           //               textAlign: TextAlign.center,
//                           //               style: TextStyle(
//                           //                 color: Colors.black,
//                           //                 fontSize: 12,
//                           //                 fontWeight: FontWeight.w400,
//                           //                 // height: 0,
//                           //               ),
//                           //             ),
//                           //           ),
//                           //         ),
//                           //         sizeHeight40,
//                           //         Padding(
//                           //           padding: EdgeInsets.symmetric(horizontal: 50),
//                           //           // width: scrSize.width*0.4,
//                           //           child: button(context: context,btnText: "Ok",onTap: (){
//                           //             Navigator.pop(context);
//                           //             // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupFullName()));
//                           //           },),
//                           //         ),
//                           //         sizeHeight30,
//                           //       ],
//                           //     ),
//                           //   );
//                           // });
//
//                           // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
//                           print("object");},
//                         btnText: "Continue",
//
//                       ),
//                     ),
//                     sizeHeight20,
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
