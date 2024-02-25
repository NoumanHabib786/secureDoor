import 'package:flutter/material.dart';
import 'package:secure_fitness_comp/resources/appColors.dart';
import 'package:secure_fitness_comp/resources/components/appbar.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:secure_fitness_comp/resources/height_width.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';
import 'package:secure_fitness_comp/utils/notficationsBar.dart';
import 'package:sizer/sizer.dart';

class ActivityPlanScreen extends StatefulWidget {
  const ActivityPlanScreen({Key? key}) : super(key: key);

  @override
  State<ActivityPlanScreen> createState() => _ActivityPlanScreenState();
}

class _ActivityPlanScreenState extends State<ActivityPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context: context, title: "Activity Plan", isAuto: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.umer3,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height(2),
                        Text(
                          "My Activity \nRecaps",
                          style: MessageFonts.notifyW5(fontSize: 14.sp),
                        ),
                        Text(
                          "Everythig, you need to know about your health",
                          style: MessageFonts.notifySimple(),
                        ),
                        Card(
                          color: AppColors.umer3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            onTap: () {
                              Utils.flushBarSuccessMessage(
                                  "Available in future", context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Get Started",
                                style: MessageFonts.notifySimple(),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                    Image.asset(
                      ImagesPaths.onBoardImage,
                      fit: BoxFit.cover,
                      height: 20.h,
                    )
                  ],
                ),
              ),
              height(2),
              Text(
                "Summry for 1 activity",
                style: MessageFonts.notifyW5(),
              ),
              height(1),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(3.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.lightBrown,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Duration",
                          style: MessageFonts.notifyW5(),
                        ),
                        Text(
                          "20m",
                          style: MessageFonts.notifySimple(),
                        ),
                      ],
                    ),
                  )),
                  width(3),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(3.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.umer1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Active Energy",
                          style: MessageFonts.notifyW5(),
                        ),
                        Text(
                          "0kcal",
                          style: MessageFonts.notifySimple(),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
              height(2),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(3.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.umer2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Distance",
                          style: MessageFonts.notifyW5(),
                        ),
                        Text(
                          "1m",
                          style: MessageFonts.notifySimple(),
                        ),
                      ],
                    ),
                  )),
                  width(3),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(3.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.umer3,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Elevation Gain",
                          style: MessageFonts.notifyW5(),
                        ),
                        Text(
                          "0ft",
                          style: MessageFonts.notifySimple(),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
