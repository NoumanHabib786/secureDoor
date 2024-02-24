import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/resources/appColors.dart';

import '../../../Provider/auth_provider.dart';
import '../../../resources/buttons.dart';
import '../../../resources/color.dart';
import '../../../resources/sizedbox.dart';
import '../../../resources/textStyle.dart';
import '../../../resources/textfield.dart';
import '../../../utils/notficationsBar.dart';
import 'bodyType_level.dart';


class AgeHeightWeightInfo extends StatefulWidget {
  const AgeHeightWeightInfo({Key? key}) : super(key: key);

  @override
  State<AgeHeightWeightInfo> createState() => _AgeHeightWeightInfoState();
}

class _AgeHeightWeightInfoState extends State<AgeHeightWeightInfo> {

  String? selectedHeightValue;
  String? selectedWeightValue;
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
                          decoration: BoxDecoration(color: Color(0xFFE4E4E4)),
                        ),
                      ),

                    ],
                  ),
                  sizeHeight20,
                  Text(
                    'Personal Information',
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
                    'We need your personal information for using according to your information data. Please add proper information.',
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
                    'Full Name',
                    style: txtStyle14AndBold,
                  ),
                  sizeHeight10,
                  ///Email
                  textField(
                      hintText: "Enter your name.",
                      keyboardType: TextInputType.name,
                      controller: provider.userName,
                      onChanged: (e){
                        // provider.signupScreenEmailValidationCheckFun(value: AllValidation.isEmailValid(e));
                        print("check -> ${e}");
                      }
                  ),
                  sizeHeight15,
                  ///Email
                  Text(
                    'Age',
                    style: txtStyle14AndBold,
                  ),
                  sizeHeight10,
                  ///Email
                  textField(
                      hintText: "Select Date Of Birth.",
                      keyboardType: TextInputType.number,
                      controller: provider.age,
                      isReadBool: true,
                      padding: EdgeInsets.only(left: 20),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Icon(Icons.arrow_drop_down,color: AppColors.mainColor,),
                      ),
                      onTap: (){
                        showModalBottomSheet(
                            context: context,
                            isDismissible: false,
                            constraints: BoxConstraints(maxHeight: 300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
                            ),
                            builder: (_){
                              return Column(
                                children: [
                                  // sizeHeight20,
                                  Padding(
                                    padding: kPaddingHorizontal10,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: (){Navigator.pop(context);},
                                            child: Text("Back",style: txtStyle14AndMainBold,)),
                                        Text("Select Date of Birth",style: txtStyle14AndBold,),
                                        TextButton(
                                            onPressed: (){
                                              if(DateTime.now().year - provider.storeSignupDateTime!.year < 18){
                                                Navigator.pop(context);
                                                Utils.flushBarErrorMessage("App restricted to users 18 and above.",context);
                                              }else{
                                                provider.storeSignupDateTimeFun(dateTime: provider.storeSignupDateTime!);
                                                Navigator.pop(context);
                                              }
                                              // print(DateTime.now().year - provider.storeSignupDateTime!.year);
                                            },
                                            child: Text("Save",style: txtStyle14AndMainBold,)),
                                      ],
                                    ),
                                  ),
                                  // sizeHeight15,
                                  Expanded(
                                    child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        //   maximumDate: DateTime.now(),

                                        maximumYear: DateTime.now().year,
                                        minimumYear: DateTime.now().year -110,
                                        onDateTimeChanged: (e){
                                          print("object ${e}");
                                          provider.storeSignupDateTimeFun(dateTime: e);
                                        }),
                                  ),
                                ],
                              );
                            });
                      },
                      onChanged: (e){
                        // provider.signupScreenEmailValidationCheckFun(value: AllValidation.isEmailValid(e));
                        print("check -> ${e}");
                      }
                  ),
                  sizeHeight15,
                  Text(
                    'Height',
                    style: txtStyle14AndBold,
                  ),
                  sizeHeight15,
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
                          value: selectedHeightValue,
                          iconEnabledColor: mainColor,

                          hint: Text("Select Height",style: txtStyle12AndOther,),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedHeightValue = newValue!;
                              print(selectedHeightValue);
                            });
                          },
                          items: <String>[
                            "3 feet 8 inches",
                            "3 feet 9 inches",
                            "3 feet 10 inches",
                            "3 feet 11 inches",
                            "4 feet 0 inches",
                            "4 feet 1 inch",
                            "4 feet 2 inches",
                            "4 feet 3 inches",
                            "4 feet 4 inches",
                            "4 feet 5 inches",
                            "4 feet 6 inches",
                            "4 feet 7 inches",
                            "4 feet 8 inches",
                            "4 feet 9 inches",
                            "4 feet 10 inches",
                            "4 feet 11 inches",
                            "5 feet 0 inches",
                            "5 feet 1 inch",
                            "5 feet 2 inches",
                            "5 feet 3 inches",
                            "5 feet 4 inches",
                            "5 feet 5 inches",
                            "5 feet 6 inches",
                            "5 feet 7 inches",
                            "5 feet 8 inches",
                            "5 feet 9 inches",
                            "5 feet 10 inches",
                            "5 feet 11 inches",
                            "6 feet 0 inches"
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
                    'Weight',
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
                          value: selectedWeightValue,
                          iconEnabledColor: mainColor,
                          hint: Text("Select Weight",style: txtStyle12AndOther,),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedWeightValue = newValue!;
                              print(selectedWeightValue);
                            });
                          },
                          items: <String>[
                            "40kg", "41kg", "42kg", "43kg", "44kg", "45kg", "46kg", "47kg", "48kg", "49kg", "50kg", "51kg", "52kg", "53kg", "54kg", "55kg", "56kg", "57kg", "58kg", "59kg", "60kg", "61kg", "62kg", "63kg", "64kg", "65kg", "66kg", "67kg", "68kg", "69kg", "70kg", "71kg", "72kg", "73kg", "74kg", "75kg", "76kg", "77kg", "78kg", "79kg", "80kg", "81kg", "82kg", "83kg", "84kg", "85kg", "86kg", "87kg", "88kg", "89kg", "90kg", "91kg", "92kg", "93kg", "94kg", "95kg", "96kg", "97kg", "98kg", "99kg", "100kg", "101kg", "102kg", "103kg", "104kg", "105kg", "106kg", "107kg", "108kg", "109kg", "110kg", "111kg", "112kg", "113kg", "114kg", "115kg", "116kg", "117kg", "118kg", "119kg", "120kg", "121kg", "122kg", "123kg", "124kg", "125kg", "126kg", "127kg", "128kg", "129kg", "130kg", "131kg", "132kg", "133kg", "134kg", "135kg", "136kg", "137kg", "138kg", "139kg", "140kg"
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BodyTypeAndWorkoutLevel()));
                        },btnText: "Continue",),
                    ),
                  ),
                  // spacer,
                  sizeHeight20,
                  // sizeHeight0,
                ],
              ),
            ),
          );
        });
  }
}
