import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';
import 'package:sizer/sizer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../resources/appColors.dart';
import '../../resources/fonts.dart';
import '../../resources/height_width.dart';
import '../../utils/Routes/RoutesName.dart';
import 'EnuthuDrawer.dart';
import 'legendWidget.dart';

class EnthuHomeScreen extends StatefulWidget {
  const EnthuHomeScreen({Key? key}) : super(key: key);

  @override
  State<EnthuHomeScreen> createState() => _EnthuHomeScreenState();
}

class _EnthuHomeScreenState extends State<EnthuHomeScreen> {
  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  // WorkOut Plan 2: Meal Plan , Nuration Tracking , Progress Traking , Activity Tracking

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const EnthuDrawer(),
      body: Column(
        children: [
          Container(
            padding:
                EdgeInsets.only(left: 2.h, right: 2.h, top: 7.h, bottom: 2.h),
            // decoration:const  BoxDecoration(
            //     color: AppColors.mainColor,
            //     borderRadius: BorderRadius.only(
            //         bottomRight: Radius.circular(15),
            //         bottomLeft: Radius.circular(15))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                width(4),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(.4),
                      Text(getGreeting(),
                          style:
                              TextFonts.textSimple(fontSize: 14.sp) //TextStyle
                          ),
                      width(1),
                      Expanded(
                        child: Text("Secure Door",
                            style: TextFonts.textW6(fontSize: 14.sp) //TextStyle
                            ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    FontAwesome.bell,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          height(5),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.h),
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceBetween,
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(),
                            rightTitles: AxisTitles(),
                            topTitles: AxisTitles(),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: bottomTitles,
                                reservedSize: 20,
                              ),
                            ),
                          ),
                          barTouchData: BarTouchData(enabled: true),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                          barGroups: [
                            generateGroupData(0, 2, 3, 2),
                            generateGroupData(1, 2, 5, 1.7),
                            generateGroupData(2, 1.3, 3.1, 2.8),
                            generateGroupData(3, 3.1, 4, 3.1),
                            generateGroupData(4, 0.8, 3.3, 3.4),
                            generateGroupData(5, 2, 5.6, 1.8),
                            generateGroupData(6, 1.3, 3.2, 2),
                          ],
                          maxY: 11 + (betweenSpace * 3),
                          // extraLinesData: ExtraLinesData(
                          //   horizontalLines: [
                          //     HorizontalLine(
                          //       y: 3.3,
                          //       color: pilateColor,
                          //       strokeWidth: 1,
                          //       dashArray: [20, 4],
                          //     ),
                          //     HorizontalLine(
                          //       y: 8,
                          //       color: quickWorkoutColor,
                          //       strokeWidth: 1,
                          //       dashArray: [20, 4],
                          //     ),
                          //     HorizontalLine(
                          //       y: 11,
                          //       color: cyclingColor,
                          //       strokeWidth: 1,
                          //       dashArray: [20, 4],
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                  ),
                  height(3),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            RoutesName.push(context, RoutesName.WorkOutScreen);
                          },
                          child: Container(
                            padding: EdgeInsets.all(2.h),
                            height: 15.h,
                            decoration: BoxDecoration(
                              color: AppColors.umer1,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Work-out Plan"),
                                Center(
                                    child: Image.asset(
                                  "assets/icons/workOut.png",
                                  height: 5.h,
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      width(5),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(2.h),
                          height: 15.h,
                          decoration: BoxDecoration(
                            color: AppColors.umer2,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Meal Plan"),
                              Center(
                                  child: Image.asset(
                                "assets/icons/meal.png",
                                height: 5.h,
                              ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  height(2),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(2.h),
                          height: 15.h,
                          decoration: BoxDecoration(
                            color: AppColors.umer3,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Nutrition Plan"),
                              Center(
                                  child: Image.asset(
                                "assets/icons/nutrition.png",
                                height: 5.h,
                              ))
                            ],
                          ),
                        ),
                      ),
                      width(5),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(2.h),
                          height: 15.h,
                          decoration: BoxDecoration(
                            color: AppColors.umer4,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Activity Plan"),
                              Center(
                                  child: Image.asset(
                                "assets/icons/activity.png",
                                height: 5.h,
                              ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  height(3),
                  Text(
                    "Our top Professionals",
                    style: MessageFonts.notifyW5(),
                  ),
                  height(1.5),
                  SizedBox(
                    height: 20.h,
                    width: 100.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Card(
                            elevation: 0,
                            color: Colors.grey.shade100,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                                width: 85.w,
                                padding: EdgeInsets.all(2.h),
                                decoration: BoxDecoration(
                                    // color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 5.h,
                                            width: 10.w,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                              ImagesPaths.demo,
                                              fit: BoxFit.cover,
                                            )
                                            // ImagesFolder
                                            //     .getImage(
                                            //     url:
                                            //     "${ImagesFolder.therapist}${therapist.image}"),
                                            ),
                                        width(2),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              height(1),
                                              Text(
                                                "Secure Door",
                                                style: MessageFonts.notifyW6(),
                                              ),
                                              height(0.5),
                                              Text(
                                                "Professional in dummy",
                                                style:
                                                    MessageFonts.notifySimple(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        width(2),
                                        Row(
                                          children: [
                                            Text("5.0",style: MessageFonts.notifyW5(),),
                                            width(1),
                                            Icon(
                                              CupertinoIcons.star_fill,
                                              color: AppColors.orangeDark,
                                              size: 2.3.h,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    height(2),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Experience",
                                          style: MessageFonts.notifySimple(
                                              fontSize: 10.sp,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "2 years",
                                          style: MessageFonts.notifyW6(
                                              fontSize: 12.sp,
                                              color: Colors.black),
                                        ),

                                      ],
                                    ),
                                    height(2),
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  final pilateColor = AppColors.mainColor;
  final cyclingColor = AppColors.umer2;
  final quickWorkoutColor = AppColors.umer3;
  final betweenSpace = 0.2;

  BarChartGroupData generateGroupData(
    int x,
    double pilates,
    double quickWorkout,
    double cycling,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          color: pilateColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout,
          color: pilateColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: pilates + betweenSpace + quickWorkout + betweenSpace,
          toY: pilates + betweenSpace + quickWorkout + betweenSpace + cycling,
          color: pilateColor,
          width: 5,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'JAN';
        break;
      case 1:
        text = 'FEB';
        break;
      case 2:
        text = 'MAR';
        break;
      case 3:
        text = 'APR';
        break;
      case 4:
        text = 'MAY';
        break;
      case 5:
        text = 'JUN';
        break;
      case 6:
        text = 'JUL';
        break;

      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }
}

class user_data {
  String x;
  int y;

  user_data(this.x, this.y);
}
