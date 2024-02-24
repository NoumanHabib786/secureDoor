import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/Screens/AuthScreen/Signup/textfield.dart';
import 'package:secure_fitness_comp/resources/textfield.dart';

import '../../../Provider/auth_provider.dart';
import '../../../resources/buttons.dart';
import '../../../resources/sizedbox.dart';
class SignupStepThreeEmailVerified extends StatefulWidget {
  const SignupStepThreeEmailVerified({Key? key}) : super(key: key);

  @override
  State<SignupStepThreeEmailVerified> createState() => _SignupStepThreeEmailVerifiedState();
}

class _SignupStepThreeEmailVerifiedState extends State<SignupStepThreeEmailVerified> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<AuthenProvider>(context,listen: false);
      // provider.checkTokenFun();
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
                              decoration: BoxDecoration(color: Color(0xFF3BABDD))
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
                      'Email Verified',
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
                      'Your email has been verified. You can now sign in \nwith your new account',
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
                      hintText: "",
                      controller: provider.email.text.isNotEmpty? provider.email : TextEditingController(text: FirebaseAuth.instance.currentUser?.email),
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
                          onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStepFourPhoneNumber()));
                            },
                          btnText: 'Continue',),
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
