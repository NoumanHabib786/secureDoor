import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_fitness_comp/resources/components/appbar.dart';
import 'package:sizer/sizer.dart';

import '../../resources/appColors.dart';
import '../../resources/components/Buttons.dart';
import '../../resources/fonts.dart';
import '../../resources/height_width.dart';
import '../../resources/imagesFolder.dart';
import '../../utils/Routes/RoutesName.dart';
import 'chat/chatScreen.dart';

class ProfessionalsList extends StatefulWidget {
  const ProfessionalsList({Key? key}) : super(key: key);

  @override
  State<ProfessionalsList> createState() => _ProfessionalsListState();
}

class _ProfessionalsListState extends State<ProfessionalsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context: context, title: "Professionals", isAuto: true),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where("accountType", isEqualTo: "Professional")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QueryDocumentSnapshot> professionals =
                snapshot.data?.docs.cast<QueryDocumentSnapshot>().toList() ??
                    [];
            return professionals.isEmpty
                ? Center(
                    child: Text(
                      "Not found",
                      style: MessageFonts.notifySimple(),
                    ),
                  )
                : ListView.builder(
                    itemCount: professionals.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      var prof = professionals[index];
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
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: ImagesFolder.getImage(
                                            url: "${prof['userImage']}"),
                                      ),
                                      width(2),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            height(1),
                                            Text(
                                              "${prof['name']}",
                                              style: MessageFonts.notifyW6(),
                                            ),
                                            height(0.5),
                                            Text(
                                              "Professional in ${prof['specialization']}",
                                              maxLines: 1,
                                              style:
                                                  MessageFonts.notifySimple(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      width(2),
                                      Row(
                                        children: [
                                          Text(
                                            "${prof['rating']}",
                                            style: MessageFonts.notifyW5(),
                                          ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Experience",
                                        style: MessageFonts.notifySimple(
                                            fontSize: 10.sp,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "${prof['experience']}",
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
                  );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: loading());
          } else if (!snapshot.hasData) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Text(
                    "No professional found",
                    style: MessageFonts.notifyW5(),
                  ),
                ));
          }
          return Container();
        },
      ),
    );
  }
}
