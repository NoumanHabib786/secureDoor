import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/utils/Routes/RoutesName.dart';
import 'package:secure_fitness_comp/utils/notficationsBar.dart';

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
  String? selectedPreferredActivitiesValue;
  String? selectedFitnessGoalValue;
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
                          decoration: BoxDecoration(color: Color(0xFF3BABDD)),
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
                       // sizeHeight40,
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
                       sizeHeight15,
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
                       sizeHeight15,
                       Text(
                         'Fitness Goal',
                         style: txtStyle14AndBold,
                       ),
                       sizeHeight10,
                       ///Fitness Goal
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
                               value: selectedFitnessGoalValue,
                               iconEnabledColor: mainColor,
                               hint: Text("Select Fitness goal",style: txtStyle12AndOther,),
                               onChanged: (String? newValue) {
                                 setState(() {
                                   selectedFitnessGoalValue = newValue!;
                                   print(selectedFitnessGoalValue);
                                 });
                               },
                               items: <String>[
                                 "Weight Loss",
                                 "Muscle Gain",
                                 "Improved Endurance",
                                 "Flexibility",
                                 "Stress Reduction",
                                 "General Fitness",
                                 "Sport-Specific Training",
                                 "Functional Strength",
                                 "Body Toning",
                                 "Health Management",
                                 "Mind-Body Connection",
                                 "Social Engagement",
                                 "Adventure and Exploration",
                                 "Pregnancy and Postpartum Fitness",
                                 "Aging Gracefully"
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
                       sizeHeight15,
                       Text(
                         'Preferred Activities',
                         style: txtStyle14AndBold,
                       ),
                       sizeHeight10,
                       ///Fitness Goal
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
                               value: selectedPreferredActivitiesValue,
                               iconEnabledColor: mainColor,
                               hint: Text("Select activities",style: txtStyle12AndOther,),
                               onChanged: (String? newValue) {
                                 setState(() {
                                   selectedPreferredActivitiesValue = newValue!;
                                   print(selectedPreferredActivitiesValue);
                                 });
                               },
                               items: <String>[
                                 "Running",
                                 "Cycling",
                                 "Swimming",
                                 "Yoga",
                                 "Pilates",
                                 "Weightlifting",
                                 "HIIT (High-Intensity Interval Training)",
                                 "CrossFit",
                                 "Dance (e.g., Zumba, Hip Hop)",
                                 "Martial Arts (e.g., Karate, Kickboxing)",
                                 "Hiking",
                                 "Rock Climbing",
                                 "Team Sports (e.g., Soccer, Basketball)",
                                 "Rowing",
                                 "Spinning/Cycling Classes",
                                 "Barre",
                                 "Tennis",
                                 "Golf",
                                 "Surfing",
                                 "Snowboarding/Skiing"
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
                               selectedFitnessGoalValue != null
                               &&
                               selectedPreferredActivitiesValue != null
                               &&
                               selectedWorkoutLevelValue != null
                               &&
                               selectedBodyTypeValue != null
                               &&
                               selectedWeightValue != null
                               &&
                               selectedHeightValue != null
                               ){
                                 showMyWaitingModal(context: context);
                              await provider.signupDataSendUpdateFun(map: {
                                 "height" : selectedHeightValue,
                                 "weight" : selectedWeightValue,
                                 "bodyType" : selectedBodyTypeValue,
                                 "workoutDifficulty" : selectedWorkoutLevelValue,
                                 "fitnessGoal" : selectedFitnessGoalValue,
                                 "preferredActivities" : selectedPreferredActivitiesValue,
                               }).then((value) {
                                 Utils.flushBarSuccessMessage("All Done", context);
                                 RoutesName.remove(context, RoutesName.EnthuHomeScreen);
                              });
                               }else{
                                 Utils.flushBarErrorMessage("Please select all fields.", context);
                               }
                               // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStepThreeEmailVerify()));
                             },btnText: "Continue",),
                         ),
                       ),
                       sizeHeight20,
                     ],
                   ),
                 ))
                  // sizeHeight0,
                ],
              ),
            ),
          );
        });
  }
}
