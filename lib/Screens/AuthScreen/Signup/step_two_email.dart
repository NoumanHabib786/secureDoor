import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/Screens/AuthScreen/Signup/step_three_email_verify.dart';
import 'package:secure_fitness_comp/resources/color.dart';
import 'package:secure_fitness_comp/resources/textfield.dart';

import '../../../Provider/auth_provider.dart';
import '../../../resources/buttons.dart';
import '../../../resources/sizedbox.dart';
import '../../../resources/textStyle.dart';

class SignupStepTwoEmail extends StatefulWidget {
  const SignupStepTwoEmail({Key? key}) : super(key: key);

  @override
  State<SignupStepTwoEmail> createState() => _SignupStepTwoEmailState();
}

class _SignupStepTwoEmailState extends State<SignupStepTwoEmail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<AuthenProvider>(context,listen: false);
      // provider.signupEmailController.clear();
      // setState(() {
      // provider.signupScreenEmailValidationCheckBool = false;
      // });
    });
  }
  @override
  Widget build(BuildContext context) {
    final scrSize = MediaQuery.of(context).size;
    return Consumer<AuthenProvider>(
        builder: (context,provider,_){
          return  Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
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
                            decoration: BoxDecoration(color: Color(0xFFE4E4E4))
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
                    'Create Account',
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
                    'Welcome to Fitness. Please fill in the information below to create your account and begin your journey to a healthier you.',
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

                  sizeHeight70,
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: scrSize.width*0.8,
                      child: button(
                        context: context,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStepThreeEmailVerify()));
                        },btnText: "Continue",),
                    ),
                  ),
                  spacer,
                  sizeHeight20,
                  // sizeHeight0,
                ],
              ),
            ),
          );
        });
  }
}
