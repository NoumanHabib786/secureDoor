import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/auth_provider.dart';
import '../../../resources/buttons.dart';
import '../../../resources/color.dart';
import '../../../resources/sizedbox.dart';
import '../../../resources/textStyle.dart';

class BodyTypeAndWorkoutLevel extends StatefulWidget {
  const BodyTypeAndWorkoutLevel({Key? key}) : super(key: key);

  @override
  State<BodyTypeAndWorkoutLevel> createState() => _BodyTypeAndWorkoutLevelState();
}

class _BodyTypeAndWorkoutLevelState extends State<BodyTypeAndWorkoutLevel> {
  String? selectedBodyTypeValue;
  String? selectedWorkoutLevelValue;
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
                            decoration: BoxDecoration(color: Color(0xFF3BABDD))
                        ),
                      ),
                      sizeWidth10,
                      Expanded(
                        child: Container(
                          // width: 70,
                          height: 4.13,
                          decoration: BoxDecoration(color: Color(0xFF3BABDD)),
                        ),
                      ),
                      sizeWidth10,
                      Expanded(
                        child: Container(
                          // width: 70,
                          height: 4.13,
                          decoration: BoxDecoration(color: Color(0xFF3BABDD)),
                        ),
                      ),

                    ],
                  ),
                  sizeHeight20,
                  Text(
                    'Workout',
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
                    'Please provide the following details to tailor your workout and body type recommendations, kickstarting your journey to a healthier you.',
                    style: TextStyle(
                      color: otherColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  sizeHeight40,

                  ///Body Type
                  Text(
                    'Body Type',
                    style: txtStyle14AndBold,
                  ),
                  sizeHeight10,
                  DropdownButtonHideUnderline(
                    child: SizedBox(
                      width: scrSize.width,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: kBorderRadius10,
                          border: Border.all(
                              color: otherColor,
                              width: 0.2
                          ),
                        ),
                        padding: kPaddingHorizontal20,
                        child: DropdownButton<String>(
                          value: selectedBodyTypeValue,
                          iconEnabledColor: mainColor,

                          hint: Text("Select Body Type",style: txtStyle12AndOther,),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedBodyTypeValue = newValue!;
                              print(selectedBodyTypeValue);
                            });
                          },
                          items: <String>[
                            "Slim",
                            "Average",
                            "Athletic",
                            "Curvy",
                            "Muscular"
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: txtStyle14AndBlack,),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  // sizeHeight10,
                  // /Password
                  // textField(
                  //     hintText: "Enter your height in cm.",
                  //     keyboardType: TextInputType.text,
                  //     controller: provider.height,
                  //     suffixIcon: SizedBox(
                  //       width: 40,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(13.0),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             border: Border.all(
                  //               color: AppColors.otherColor,
                  //               width: 0.6
                  //             ),
                  //             borderRadius: BorderRadius.circular(50)
                  //
                  //           ),
                  //           child: Center(
                  //             child: Text("CM",style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 8
                  //             ),),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     onChanged: (e){
                  //       // provider.signupScreenEmailValidationCheckFun(value: AllValidation.isEmailValid(e));
                  //       print("check -> ${e}");
                  //     }
                  // ),
                  sizeHeight15,
                  Text(
                    'Workout Difficulty',
                    style: txtStyle14AndBold,
                  ),
                  sizeHeight10,
                  ///Weight
                  DropdownButtonHideUnderline(
                    child: SizedBox(
                      width: scrSize.width,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: kBorderRadius10,
                          border: Border.all(
                              color: otherColor,
                              width: 0.2
                          ),
                        ),
                        padding: kPaddingHorizontal20,
                        child: DropdownButton<String>(
                          value: selectedWorkoutLevelValue,
                          iconEnabledColor: mainColor,
                          hint: Text("Select workout difficulty",style: txtStyle12AndOther,),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedWorkoutLevelValue = newValue!;
                              print(selectedWorkoutLevelValue);
                            });
                          },
                          items: <String>[
                          "Beginner",
                          "Intermediate",
                          "Advanced",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: txtStyle14AndBlack,),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),

                  sizeHeight70,
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: scrSize.width*0.8,
                      child: button(
                        context: context,
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStepThreeEmailVerify()));
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
