import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_fitness_comp/Screens/Enthusist/workOut/workOutScreen.dart';
import 'package:secure_fitness_comp/resources/appColors.dart';
import 'package:secure_fitness_comp/resources/components/appbar.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:secure_fitness_comp/resources/height_width.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';
import 'package:sizer/sizer.dart';

class WorkOutDetails extends StatefulWidget {
  WorkOuts? workOuts;

  WorkOutDetails({Key? key, this.workOuts}) : super(key: key);

  @override
  State<WorkOutDetails> createState() => _WorkOutDetailsState();
}

class _WorkOutDetailsState extends State<WorkOutDetails> {
  var image1 = ImagesPaths.push;
  var image2 = ImagesPaths.sit_up;
  var image3 = ImagesPaths.pulling_up;
  var image4 = ImagesPaths.bench_sit_up;
  var image5 = ImagesPaths.push_up;

  var info1 =
      "When incorporating push exercises into a workout routine, it's important to balance them with pull exercises to prevent muscular imbalances. A common approach is to use a push/pull/legs (PPL) split, dedicating specific days to push exercises, pull exercises, and leg workouts. This allows for adequate recovery and ensures a well-rounded training program. Remember, proper form and technique are crucial to prevent injury and maximize the benefits of push exercises. Beginners should start with lighter weights or bodyweight exercises to build foundational strength and gradually progress to more challenging variations or heavier loads.";
  var info2 =
      "While sit-ups are beneficial, they are not the only exercise needed for a strong core or visible abs. A comprehensive fitness routine that includes a variety of core exercises, cardiovascular activity, and a healthy diet is essential. Additionally, individuals with back issues should proceed with caution or consult a fitness professional, as sit-ups can exacerbate certain conditions. Alternatives like planks can offer similar benefits without the potential strain on the back.";
  var info3 =
      "Pull-ups are a fundamental upper-body exercise that targets multiple muscle groups, including the back, shoulders, arms, and core. This compound exercise is highly effective for developing strength, endurance, and muscle definition. Pull-ups are performed using a horizontal bar, and they require you to lift your entire body weight by pulling yourself up until your chin is above the bar.";
  var info4 =
      "The term bench sit-up typically refers to sit-ups performed on an exercise bench, which can either be a flat bench or, more commonly, an adjustable incline/decline bench. This variation of the classic sit-up allows for a greater range of motion and can increase the intensity of the workout by adding gravity into the mix, especially when performed on an incline";
  var info5 =
      "Push-ups are a fundamental bodyweight exercise that engages multiple muscle groups, making them a staple in many fitness routines. They primarily target the chest (pectoral muscles), triceps, and anterior deltoids (shoulders), with the core and lower back muscles also engaged to maintain proper form. Push-ups are versatile, with numerous variations to challenge different fitness levels and focus on various muscle groups";
  var info6 =
      "Fitness encompasses a broad range of activities, goals, and disciplines focused on improving or maintaining physical health and overall well-being. It involves a combination of exercise, nutrition, rest, and mental health strategies to achieve optimal health outcomes.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(
          context: context, title: "${widget.workOuts?.name}", isAuto: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: "${widget.workOuts?.name}",
                child: Image.asset(
                  "${widget.workOuts?.image}",
                  height: 15.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            height(1),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Row(
                children: [
                  Container(
                    width: 1.w,
                    height: 2.h,
                    color: AppColors.mainColor,
                  ),
                  width(5),
                  Text(
                    "${widget.workOuts?.time} min",
                    style: MessageFonts.notifyW6(),
                  ),
                  width(2),
                  Text(
                    "${widget.workOuts?.exercies} exercise",
                    style: MessageFonts.notifyW6(),
                  ),
                ],
              ),
            ),
            height(2),
            Padding(
              padding: EdgeInsets.all(2.h),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.workOuts?.exercies,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  var workOut = widget.workOuts;
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                            child: Container(
                              height: 70.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12))),
                              child: Padding(
                                padding: EdgeInsets.all(2.h),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              CupertinoIcons.xmark,
                                              color: Colors.red,
                                            )),
                                      ),
                                      height(2),
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        child: Image.asset(
                                          index == 0
                                              ? image1
                                              : index == 1
                                                  ? image2
                                                  : index == 2
                                                      ? image3
                                                      : index == 3
                                                          ? image4
                                                          : index == 4
                                                              ? image5
                                                              : "${workOut?.image}",
                                          height: 25.h,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      ),
                                      height(2),
                                      Text(
                                        "Information",
                                        style: MessageFonts.notifyW6(),
                                      ),
                                      Text(
                                        index == 0
                                            ? info1
                                            : index == 1
                                                ? info2
                                                : index == 2
                                                    ? info3
                                                    : index == 3
                                                        ? info4
                                                        : index == 4
                                                            ? info5
                                                            : info6,
                                        style: MessageFonts.notifySimple(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade100),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12)),
                            child: Image.asset(
                              index == 0
                                  ? image1
                                  : index == 1
                                      ? image2
                                      : index == 2
                                          ? image3
                                          : index == 3
                                              ? image4
                                              : index == 4
                                                  ? image5
                                                  : "${workOut?.image}",
                              height: 10.h,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          height(2),
                          Text(
                            index == 0
                                ? "Push"
                                : index == 1
                                    ? "Sit Up"
                                    : index == 2
                                        ? "Pulling Up"
                                        : index == 3
                                            ? "Bench Sit Up"
                                            : index == 4
                                                ? "Push Up"
                                                : "Jumping jacks",
                            style: MessageFonts.notifySimple(),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
