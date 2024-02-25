import 'package:calender_picker/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secure_fitness_comp/resources/components/appbar.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:secure_fitness_comp/resources/height_width.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/appColors.dart';

class NutrationScreen extends StatefulWidget {
  const NutrationScreen({Key? key}) : super(key: key);

  @override
  State<NutrationScreen> createState() => _NutrationScreenState();
}

class _NutrationScreenState extends State<NutrationScreen> {
  var selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context: context, title: "Nutrition Plan", isAuto: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CalenderPicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColors.mainColor,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ),
          height(2),
          Divider(
              color: Colors.grey.withOpacity(0.4), endIndent: 10, indent: 10),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Breakfast",
                      style: MessageFonts.notifyW6(),
                    ),
                    height(2),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12)),
                            child: Image.asset(
                              "assets/images/breakfast.jpg",
                              height: 25.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          height(2),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Chai pratha breakfast",
                              style: MessageFonts.notifyW5(),
                            ),
                          ),
                          height(1),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "220 kcal 15 min",
                              style: MessageFonts.notifySimple(),
                            ),
                          ),
                          height(2),
                        ],
                      ),
                    ),
                    height(2),
                    Text(
                      "Lunch",
                      style: MessageFonts.notifyW6(),
                    ),
                    height(2),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12)),
                            child: Image.asset(
                              "assets/images/breakfast.jpg",
                              height: 25.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          height(2),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Chai pratha breakfast",
                              style: MessageFonts.notifyW5(),
                            ),
                          ),
                          height(1),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "220 kcal 15 min",
                              style: MessageFonts.notifySimple(),
                            ),
                          ),
                          height(2),
                        ],
                      ),
                    ),
                    height(2),
                    Text(
                      "Dinner",
                      style: MessageFonts.notifyW6(),
                    ),
                    height(2),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12)),
                            child: Image.asset(
                              "assets/images/breakfast.jpg",
                              height: 25.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          height(2),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Chai pratha breakfast",
                              style: MessageFonts.notifyW5(),
                            ),
                          ),
                          height(1),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "220 kcal 15 min",
                              style: MessageFonts.notifySimple(),
                            ),
                          ),
                          height(2),
                        ],
                      ),
                    ),
                    height(2),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
