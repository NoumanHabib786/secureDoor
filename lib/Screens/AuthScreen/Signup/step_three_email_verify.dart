// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/resources/imagesFolder.dart';
import 'package:secure_fitness_comp/resources/textfield.dart';
import '../../../Provider/auth_provider.dart';
import '../../../resources/buttons.dart';
import '../../../resources/dialogBox.dart';
import '../../../resources/imagesPaths.dart';
import '../../../resources/sizedbox.dart';
import 'age_height_weigth_info.dart';

class SignupStepThreeEmailVerify extends StatefulWidget {
  const SignupStepThreeEmailVerify({Key? key}) : super(key: key);

  @override
  State<SignupStepThreeEmailVerify> createState() => _SignupStepThreeEmailVerifyState();
}

class _SignupStepThreeEmailVerifyState extends State<SignupStepThreeEmailVerify> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<AuthenProvider>(context,listen: false);
      provider.verificationCheckFun(context: context,mounted: mounted);
    });
  }
  @override
  Widget build(BuildContext context) {
    final scrSize = MediaQuery.of(context).size;
    return Consumer<AuthenProvider>(
        builder: (context,provider,_){
          return  Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: kPaddingHorizontal20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizeStatusBar(context: context),
                    signupBackButton(context: context),
                    sizeHeight20,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            // width: 70.0,
                            height: 4.13,
                            decoration: BoxDecoration(color: Color(0xFF3BABDD)),
                          ),
                        ),
                        sizeWidth10,
                        Expanded(
                          child: Container(
                            // width: 70,
                              height: 4.13,
                              decoration: BoxDecoration(color: Color(0xFF3BABDD))
                          ),
                        ),
                        sizeWidth10,
                        Expanded(
                          child: Container(
                            // width: 70,
                              height: 4.13,
                              decoration: BoxDecoration(color:  Color(0xFFE4E4E4))
                          ),
                        ),
                        sizeWidth10,
                        Expanded(
                          child: Container(
                            // width: 70,
                            height: 4.13,
                            decoration: BoxDecoration(color: Color(0xFFE4E4E4)),
                          ),
                        ),

                      ],
                    ),
                    sizeHeight20,
                    Text(
                      'Confirm Email',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        // fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    sizeHeight10,
                    Text(
                      'In order to use Fitness App, please verify\nyour email',
                      style: TextStyle(
                        color: Color(0xFF97A2AC),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    sizeHeight30,
                    ///Email
                    textField(
                      hintText: ".",
                      controller: provider.email.text.isEmpty? TextEditingController(text: FirebaseAuth.instance.currentUser?.email) : provider.email,
                      isReadBool: true,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    sizeHeight70,
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: scrSize.width*0.8,
                        child: button(
                          context: context,
                          onTap: ()async{
                            await provider.sendVerificationEmailLinkFun();
                            dialogBox(
                              context: context,
                              content: Column(
                                children: [
                                  Image.asset(ImagesPaths.confirmEmailDialogIcon,width: 36,
                                    height: 36,),
                                  sizeHeight30,
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'Confirm your email address',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        // height: 0,
                                      ),
                                    ),
                                  ),
                                  sizeHeight40,
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'We sent a confirmation email to:\n',
                                          style: TextStyle(
                                            color: Color(0xFF97A2AC),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${provider.email.text.isNotEmpty? provider.email.text : FirebaseAuth.instance.currentUser?.email} \n',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '\n',
                                          style: TextStyle(
                                            color: Color(0xFF97A2AC),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Check your email and click on the\nconfirmation link to continue.',
                                          style: TextStyle(
                                            color: Color(0xFF97A2AC),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  sizeHeight40,
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 50),
                                    // width: scrSize.width*0.4,
                                    child: button(context: context,btnText: "Resend email",onTap: () async {
                                      provider.sendVerificationEmailLinkFun();
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStepThreeEmailVerified()));
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupFullName()));
                                    },),
                                  ),
                                  sizeHeight30,
                                  TextButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AgeHeightWeightInfo()));
                                      // Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Go Back',
                                      style: TextStyle(
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),),
                                  // sizeHeight30,
                                ],
                              ),
                            );
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStepThreeEmailVerified()));

                          },btnText: 'Send verification email',),
                      ),
                    ),
                    sizeHeight20,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
