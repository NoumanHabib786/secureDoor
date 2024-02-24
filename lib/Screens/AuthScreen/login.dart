import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/auth_provider.dart';
import '../../resources/buttons.dart';
import '../../resources/color.dart';
import '../../resources/sizedbox.dart';
import '../../resources/textStyle.dart';
import '../../resources/textfield.dart';
import 'Signup/step_two_email.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<AuthenProvider>(context,listen: false);
      provider.email.clear();
      provider.password.clear();
      // provider.loginScreenPasswordValidationCheckFun(value: AllValidation.isPasswordValid(""));
      // provider.loginScreenEmailValidationCheckFun(value: AllValidation.isEmailValid(""));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenProvider>(
        builder: (context,provider,_){
          return  Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: _formKey,
              child: Padding(
                padding: kPaddingHorizontal20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizeStatusBar(context: context),
                    sizeHeight30,
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 24,
                        // fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    sizeHeight10,
                    Text(
                      'We are happy to see you here, please enter the email and password associated with your Fitness Account.',
                      style: TextStyle(
                        color: otherColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    sizeHeight40,
                    ///Email
                    Text(
                      'Email',
                      style: txtStyle14AndBold,
                    ),
                    sizeHeight10,
                    ///Email
                    textField(
                        hintText: "Enter your email.",
                        keyboardType: TextInputType.emailAddress,
                        controller: provider.email,
                        onChanged: (e){
                          // provider.signupScreenEmailValidationCheckFun(value: AllValidation.isEmailValid(e));
                          print("check -> ${e}");
                        }
                    ),
                    sizeHeight15,
                    Text(
                      'Password',
                      style: txtStyle14AndBold,
                    ),
                    sizeHeight10,
                    ///Password
                    textField(
                        hintText: "Enter your password.",
                        keyboardType: TextInputType.visiblePassword,
                        controller: provider.password,
                        onChanged: (e){
                          // provider.signupScreenEmailValidationCheckFun(value: AllValidation.isEmailValid(e));
                          print("check -> ${e}");
                        }
                    ),
                    sizeHeight20,
                    ///Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.red
                            ),
                            onPressed: (){
                              // dismissKeyboard(context: context);
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: redColor,
                                fontSize: 12,
                                // fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                height: 0,
                              ),
                            )),
                        sizeWidth20,
                      ],
                    ),
                    sizeHeight20,
                    ///Button
                    button(
                      context: context,
                      onTap: () async {
                        // String error = '';
                        if (provider.email.text.isNotEmpty && provider.password.text.isNotEmpty) {
                          // print('Form is valid, email: $_email');
                          provider.loginEmailAndPassword(context: context,emailController: provider.email.text,passwordController: provider.password.text,);

                          // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        }
                        print("object");},
                      btnText: "Login",

                    ),

                    spacer,
                    Align(
                      alignment: Alignment.topCenter,
                      child: RichText(
                        // textAlign: TextAlign.center,
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don’t have an account?  ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap = (){
                                    print("object");
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStepTwoEmail()));
                                  },
                                  text: 'Signup',
                                  style: TextStyle(
                                    color: mainColor,fontWeight: FontWeight.bold
                                  ),
                                ),
                              ])),
                    ),
                    sizeHeight40,
                  ],
                ),
              ),
            ),
          );
        });
  }
}


Future<String?> getSmsCodeFromUser(BuildContext context) async {
  String? smsCode;

  // Update the UI - wait for the user to enter the SMS code
  await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text('SMS code:'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Sign in'),
          ),
          OutlinedButton(
            onPressed: () {
              smsCode = null;
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
        content: Container(
          padding: const EdgeInsets.all(20),
          child: TextField(
            onChanged: (value) {
              smsCode = value;
            },
            textAlign: TextAlign.center,
            autofocus: true,
          ),
        ),
      );
    },
  );

  return smsCode;
}