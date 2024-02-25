import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/Provider/postsProvider.dart';
import 'package:secure_fitness_comp/Screens/Enthusist/addAchievements.dart';
import 'package:secure_fitness_comp/Screens/Enthusist/postEnthuComments.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';
import 'package:secure_fitness_comp/utils/Routes/RoutesName.dart';

import 'package:sizer/sizer.dart';

import '../../../resources/components/Buttons.dart';
import '../../../resources/imagesFolder.dart';
import '../../resources/appColors.dart';
import '../../resources/components/appbar.dart';
import '../../resources/height_width.dart';

class PostEnthuScreen extends StatefulWidget {
  bool? isPatient;

  PostEnthuScreen({Key? key, this.isPatient}) : super(key: key);

  @override
  State<PostEnthuScreen> createState() => _PostEnthuScreenState();
}

class _PostEnthuScreenState extends State<PostEnthuScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: app_bar(
            isAuto: true,
            context: context,
            title: "Posts",
            action: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () {
                  RoutesName.push2(context, const AddAcheivementsScreen());
                },
                child: const Icon(
                  Icons.add_circle,
                  color: AppColors.mainColor,
                ),
              ),
            )),
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("posts")
                  .orderBy(descending: true, "timeStemp")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("here data");
                  List<QueryDocumentSnapshot> posts = snapshot.data?.docs
                          .cast<QueryDocumentSnapshot>()
                          .toList() ??
                      [];
                  print(posts.length);
                  return posts.isEmpty
                      ? Center(
                          child: Text(
                            "No post available",
                            style: MessageFonts.notifyW5(),
                          ),
                        )
                      : Stack(
                          children: [
                            SingleChildScrollView(
                              controller: _scrollController,
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Padding(
                                padding: EdgeInsets.all(2.h),
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: posts.length,
                                      itemBuilder: (context, index) {
                                        var post = posts[index];
                                        DateTime dateTime =
                                            DateTime.fromMillisecondsSinceEpoch(
                                                post['timeStemp']);
                                        DateTime currentTime = DateTime.now();
                                        Duration difference =
                                            currentTime.difference(dateTime);
                                        String timeAgo;

                                        if (difference.inMinutes < 1) {
                                          timeAgo = 'Just now';
                                        } else if (difference.inMinutes < 60) {
                                          timeAgo =
                                              '${difference.inMinutes}min ago';
                                        } else if (difference.inHours < 24) {
                                          timeAgo = '${difference.inHours}h';
                                        } else {
                                          timeAgo = DateFormat('dd/MM/yyyy')
                                              .format(dateTime);
                                        }
                                        return InkWell(
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            padding: EdgeInsets.all(1.h),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Colors.grey.shade100,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              shadows: const [
                                                BoxShadow(
                                                  color: Color(0x28000000),
                                                  blurRadius: 3,
                                                  offset: Offset(0, 0),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        height: 6.h,
                                                        width: 10.w,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors
                                                              .mainColor,
                                                        ),
                                                        child: Image.asset(
                                                            ImagesPaths
                                                                .pulling_up)),
                                                    width(3),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${post['userName']}",
                                                          style: MessageFonts
                                                              .notifyW6(
                                                                  fontSize:
                                                                      11.sp),
                                                        ),
                                                        height(0.5),
                                                        Text(
                                                          "$timeAgo",
                                                          style:
                                                              TextFonts.textW5(
                                                                  fontSize:
                                                                      10.sp),
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    RichText(
                                                        text: TextSpan(
                                                            style: TextFonts
                                                                .textW5(
                                                              fontSize: 11.sp,
                                                            ),
                                                            children: [
                                                          const TextSpan(
                                                              text:
                                                                  "Posted on "),
                                                          TextSpan(
                                                            text: DateFormat(
                                                                    "dd/MM/yyyy")
                                                                .format(DateTime
                                                                    .fromMillisecondsSinceEpoch(
                                                                        post[
                                                                            'timeStemp'])),
                                                            style: TextFonts
                                                                .textW6(
                                                              fontSize: 10.sp,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.6000000238418579),
                                                            ),
                                                          ),
                                                        ])),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        height(2),
                                                        Text(
                                                          "${post['title']}",
                                                          style:
                                                              TextFonts.textW7(
                                                                  fontSize:
                                                                      13.sp),
                                                        ),
                                                        height(1),
                                                      ],
                                                    ),
                                                    height(2),
                                                    Text(
                                                      "${post['details']}",
                                                      style: TextFonts
                                                          .textSimple(),
                                                    ),
                                                    height(2),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      height: 20.h,
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          child: ImagesFolder
                                                              .getImage(
                                                                  url:
                                                                      "${post['postiImage']}")),
                                                    ),
                                                    height(2),
                                                    Row(
                                                      children: [
                                                        GestureDetector(
                                                          onDoubleTap: () {
                                                            print("object");
                                                          },
                                                          child: Icon(CupertinoIcons
                                                              .hand_thumbsup_fill),
                                                        ),
                                                        width(1),
                                                        Text(
                                                          "10k",
                                                          style: TextFonts
                                                              .textW5(),
                                                        ),
                                                        Spacer(),
                                                        InkWell(
                                                            onTap: () {
                                                              showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                shape: const RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                12),
                                                                        topRight:
                                                                            Radius.circular(12))),
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return BackdropFilter(
                                                                      filter: ImageFilter.blur(
                                                                          sigmaX:
                                                                              1,
                                                                          sigmaY:
                                                                              1,
                                                                          tileMode: TileMode
                                                                              .mirror),
                                                                      child:
                                                                          CommentsScreen());
                                                                },
                                                              );
                                                            },
                                                            child: Icon(
                                                                CupertinoIcons
                                                                    .chat_bubble_fill)),
                                                        Text(
                                                          "20k",
                                                          style: TextFonts
                                                              .textW5(),
                                                        ),
                                                      ],
                                                    ),
                                                    height(2)
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            height(2),
                          ],
                        );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: loading());
                } else if (!snapshot.hasData) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "No message",
                        style: MessageFonts.notifyW5(),
                      ));
                }
                return Container();
              },
            )));
  }
}
