import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:secure_fitness_comp/Screens/Enthusist/workOut/workOutDetails.dart';
import 'package:secure_fitness_comp/resources/appColors.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:secure_fitness_comp/resources/height_width.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';
import 'package:secure_fitness_comp/utils/Routes/RoutesName.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/components/appbar.dart';

class WorkOutScreen extends StatefulWidget {
  const WorkOutScreen({Key? key}) : super(key: key);

  @override
  State<WorkOutScreen> createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
  List<WorkOuts> beginnersList = [
    WorkOuts(
        image: ImagesPaths.workOutAbs,
        name: "ABS BEGINNER",
        time: 20,
        exercies: 16),
    WorkOuts(
        image: ImagesPaths.workOutChest,
        name: "CHEST BEGINNER",
        time: 7,
        exercies: 11),
    WorkOuts(
        image: ImagesPaths.workOutArm,
        name: "ARM BEGINNER",
        time: 17,
        exercies: 19),
    WorkOuts(
        image: ImagesPaths.workOutLegs,
        name: "LEGS BEGINNER",
        time: 26,
        exercies: 23),
    WorkOuts(
        image: ImagesPaths.workOutChest,
        name: "SHOULDER  BEGINNER",
        time: 17,
        exercies: 17),
  ];

  List<WorkOuts> intermediateList = [
    WorkOuts(
        image: ImagesPaths.workOutAbs,
        name: "ABS INTERMEDIATE",
        time: 29,
        exercies: 21),
    WorkOuts(
        image: ImagesPaths.workOutChest,
        name: "CHEST INTERMEDIATE",
        time: 15,
        exercies: 14),
    WorkOuts(
        image: ImagesPaths.workOutArm,
        name: "ARM INTERMEDIATE",
        time: 26,
        exercies: 25),
    WorkOuts(
        image: ImagesPaths.workOutLegs,
        name: "LEGS INTERMEDIATE",
        time: 41,
        exercies: 36),
    WorkOuts(
        image: ImagesPaths.workOutChest,
        name: "SHOULDER  INTERMEDIATE",
        time: 19,
        exercies: 17),
  ];
  List<WorkOuts> advanceList = [
    WorkOuts(
        image: ImagesPaths.workOutAbs,
        name: "ABS ADVANCED",
        time: 36,
        exercies: 21),
    WorkOuts(
        image: ImagesPaths.workOutChest,
        name: "CHEST ADVANCED",
        time: 19,
        exercies: 16),
    WorkOuts(
        image: ImagesPaths.workOutArm,
        name: "ARM ADVANCED",
        time: 32,
        exercies: 28),
    WorkOuts(
        image: ImagesPaths.workOutLegs,
        name: "LEGS ADVANCED",
        time: 53,
        exercies: 43),
    WorkOuts(
        image: ImagesPaths.workOutChest,
        name: "SHOULDER  ADVANCED",
        time: 19,
        exercies: 17),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context: context, title: "Work Outs", isAuto: true),
      body: Padding(
          padding: EdgeInsets.all(2.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Beginner",
                  style: MessageFonts.notifyW7(),
                ),
                ListView.builder(
                  itemCount: beginnersList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        RoutesName.push2(
                            context,
                            WorkOutDetails(
                              workOuts: beginnersList[index],
                            ));
                      },
                      child: Container(
                        height: 18.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Hero(
                                tag: "${beginnersList[index].name}",
                                child: Image.asset(
                                  "${beginnersList[index].image}",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 30,
                                left: 10,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${beginnersList[index].name}",
                                      style: TextFonts.textW7(
                                          color: Colors.white, fontSize: 15.sp),
                                    ),
                                    height(1),
                                    Row(
                                      children: [
                                        Text(
                                          "${beginnersList[index].time} min",
                                          style: TextFonts.textSimple(
                                            color: Colors.white,
                                          ),
                                        ),
                                        width(2),
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 1,
                                        ),
                                        width(2),
                                        Text(
                                          "${beginnersList[index].exercies} exercises",
                                          style: TextFonts.textSimple(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
                height(2),
                Text(
                  "Intermediate",
                  style: MessageFonts.notifyW7(),
                ),
                ListView.builder(
                  itemCount: intermediateList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 18.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "${intermediateList[index].image}",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                              bottom: 30,
                              left: 10,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${intermediateList[index].name}",
                                    style: TextFonts.textW7(
                                        color: Colors.white, fontSize: 15.sp),
                                  ),
                                  height(1),
                                  Row(
                                    children: [
                                      Text(
                                        "${intermediateList[index].time} min",
                                        style: TextFonts.textSimple(
                                          color: Colors.white,
                                        ),
                                      ),
                                      width(2),
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 1,
                                      ),
                                      width(2),
                                      Text(
                                        "${intermediateList[index].exercies} exercises",
                                        style: TextFonts.textSimple(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    );
                  },
                ),
                height(2),
                Text(
                  "Advance",
                  style: MessageFonts.notifyW7(),
                ),
                ListView.builder(
                  itemCount: advanceList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 18.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "${advanceList[index].image}",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                              bottom: 30,
                              left: 10,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${advanceList[index].name}",
                                    style: TextFonts.textW7(
                                        color: Colors.white, fontSize: 15.sp),
                                  ),
                                  height(1),
                                  Row(
                                    children: [
                                      Text(
                                        "${advanceList[index].time} min",
                                        style: TextFonts.textSimple(
                                          color: Colors.white,
                                        ),
                                      ),
                                      width(2),
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 1,
                                      ),
                                      width(2),
                                      Text(
                                        "${advanceList[index].exercies} exercises",
                                        style: TextFonts.textSimple(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    );
                  },
                ),
                height(2),
              ],
            ),
          )),
    );
  }
}

class WorkOuts {
  String? name;
  String? image;
  int? time;
  int? exercies;

  WorkOuts({this.name, this.image, this.time, this.exercies});
}
