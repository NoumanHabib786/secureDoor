import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/models/enthusistModel.dart';
import 'package:secure_fitness_comp/resources/sizedbox.dart';
import 'package:sizer/sizer.dart';

import '../../Provider/auth_provider.dart';
import '../../models/professional_model.dart';
import '../../resources/appColors.dart';
import '../../resources/components/Buttons.dart';
import '../../resources/components/appbar.dart';
import '../../resources/fonts.dart';
import '../../resources/height_width.dart';
import '../../resources/imagesFolder.dart';
import '../../utils/Routes/RoutesName.dart';
import '../Enthusist/EnuthuDrawer.dart';
import '../Enthusist/professional.dart';
class ProfessionalHomeScreen extends StatefulWidget {
  const ProfessionalHomeScreen({Key? key}) : super(key: key);

  @override
  State<ProfessionalHomeScreen> createState() => _ProfessionalHomeScreenState();
}

class _ProfessionalHomeScreenState extends State<ProfessionalHomeScreen> {
  // WorkOut Plan 2: Meal Plan , Nuration Tracking , Progress Traking , Activity Tracking

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  fetch() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AuthenProvider>().userDataFunction(context);
    });
  }
  List<EnthusistModel> allUsers = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenProvider>(builder: (context,provider,_){
      return Scaffold(
          key: _scaffoldKey,
          appBar: app_bar(
              context: context,
              title: "Professional Fitness",
              withoutLeading: InkWell(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: const Icon(Icons.menu))),
          drawer: const EnthuDrawer(),
          body: Consumer<AuthenProvider>(
            builder: (context, data, child) {
              return data.userLoading
                  ? Center(
                child: loading(),
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(2),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      "Hi , ${data.enthusistModel?.name ?? data.professionalUserModel?.name}",
                      style: MessageFonts.notifyW5(fontSize: 15.sp),
                    ),
                  ),
                  height(2),
                  Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                children: [
                                  Text(
                                    "People who Follow You",
                                    style: MessageFonts.notifyW5(),
                                  ),

                                ],
                              ),
                              height(1.5),
                              SizedBox(
                                width: double.maxFinite,
                                height: 60,
                                child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("users")
                                        .snapshots(),
                                    builder: (context,professionalSnapshot) {
                                      final allDoc = professionalSnapshot.data;
                                      List<EnthusistModel> allUser = [];
                                      allDoc?.docs.forEach((element) {
                                        if(element.get("accountType") == "Enthusiast"){
                                          allUser.add(EnthusistModel.fromJson(element.data()));
                                        }
                                      });
                                      allUsers = allUser.where((element) => provider.professionalUserModel!.followList.contains(element.userId)).toList();
                                      print("alllUsers ${allUsers.length}");
                                      return allUsers.isEmpty? Center(child: Text("No enthusiast available")) :  ListView.builder(
                                          itemCount: allUsers.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context,index){
                                            return CircleAvatar(
                                              radius: 40,
                                              backgroundColor: AppColors.mainColor,
                                              child: Icon(CupertinoIcons.person_alt_circle,color: Colors.white,),
                                              // backgroundColor: MainColor.maincolor,
                                            );
                                          });
                                    }
                                ),
                              ),
                              Text("Reviews",style: MessageFonts.notifyW5(),),
                              sizeHeight15,
                              SizedBox(
                                width: double.maxFinite,
                                child: ListView.builder(
                                    itemCount: 5,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context,index){
                                      return Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        color: Colors.grey.shade100,
                                        child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 70,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: ImagesFolder.getImage(url: provider.professionalUserModel!.userImage),
                                                  ),
                                                  ),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                "Umer Ferrari",
                                                                style: TextStyle(
                                                                    color: Colors.black),
                                                                maxLines: null,
                                                                // minFontSize: 12,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 2,
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "4.0",
                                                              style: MessageFonts
                                                                  .notifyW5(),
                                                            ),
                                                            width(1),
                                                            Icon(
                                                              CupertinoIcons
                                                                  .star_fill,
                                                              color: AppColors
                                                                  .orangeDark,
                                                              size: 1.8
                                                                  .h,
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                          // height: 33,
                                                          // width: 200,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Great Trainer!",
                                                                style: TextStyle(
                                                                    color: Colors.grey),
                                                                overflow: TextOverflow.ellipsis,
                                                                textAlign: TextAlign.start,
                                                              ),
                                                              Text(
                                                                DateFormat("MMM dd, yyyy").format(DateTime.now()),
                                                                style: TextStyle(
                                                                    color: Colors.grey, fontSize: 14),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )

                            ],
                          ),
                        ),
                      ))
                ],
              );
            },
          ));
    });
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
