import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/Screens/AuthScreen/Signup/professional_signup.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<AuthenProvider>(context,listen: false);
      provider.age.clear();
      provider.userName.clear();
    });
  }

  String? selectedAccountTypeValue;
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
                  Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              'Account Type',
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
                                    value: selectedAccountTypeValue,
                                    iconEnabledColor: mainColor,

                                    hint: Text("Select Height",style: txtStyle12AndOther,),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedAccountTypeValue = newValue!;
                                        print(selectedAccountTypeValue);
                                      });
                                    },
                                    items: <String>[
                                      "Enthusiast",
                                      "Professional",
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
                                  onTap: () async {
                                    if(
                                    selectedAccountTypeValue != null
                                        &&
                                    provider.userName.text.isNotEmpty
                                    &&
                                    provider.age.text.isNotEmpty
                                    ){
                                      showMyWaitingModal(context: context);
                                      await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).set({
                                        "name" : provider.userName.text,
                                        "age" : provider.storeSignupDateTime,
                                        "accountType" : selectedAccountTypeValue,
                                        "userId" : FirebaseAuth.instance.currentUser?.uid,
                                        "createdAt" : DateTime.now().millisecondsSinceEpoch
                                      }).then((value) {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => selectedAccountTypeValue == "Professional"? ProfessionalSignupScreen() : BodyTypeAndWorkoutLevel()));
                                      }).onError((error, stackTrace) {
                                        Utils.flushBarErrorMessage(error.toString(), context);
                                      });
                                    }else{
                                      Utils.flushBarErrorMessage("Please fill all information", context);
                                    }
                                  },btnText: "Continue",),
                              ),
                            ),
                            // spacer,
                            sizeHeight20,
                          ],
                        ),
                      ),),
                  // sizeHeight0,
                ],
              ),
            ),
          );
        });
  }
}
