import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/imagesFolder.dart';
import '../../resources/appColors.dart';
import '../../resources/height_width.dart';

class CommentsScreen extends StatefulWidget {
  CommentsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  FocusNode messageNode = FocusNode();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(2.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(
                      "Comments",
                      style: MessageFonts.notifyW6(),
                    ),
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          CupertinoIcons.xmark,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  controller: scrollController,
                  itemCount: 10,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    var sDAte = "${DateTime.now()}";
                    DateTime dateTime = DateTime.parse(sDAte);
                    DateTime currentTime = DateTime.now();
                    Duration difference = currentTime.difference(dateTime);
                    String timeAgo;

                    if (difference.inMinutes < 1) {
                      timeAgo = 'Just now';
                    } else if (difference.inMinutes < 60) {
                      timeAgo = '${difference.inMinutes}min ago';
                    } else if (difference.inHours < 24) {
                      timeAgo = '${difference.inHours}h ago';
                    } else {
                      timeAgo = DateFormat('dd/MM/yyyy').format(dateTime);
                    }

                    return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x282E4682),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(top: 0.8.h),
                      child: Column(
                        children: [
                          ListTile(
                            minLeadingWidth: 2,
                            minVerticalPadding: 3,
                            visualDensity: const VisualDensity(
                                vertical: -4, horizontal: -4),
                            leading: Container(
                                width: 10.w,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(ImagesPaths.sit_up)),
                            title: Text(
                              "Secure",
                              style: TextFonts.textW6(fontSize: 11.sp),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Details",
                                  style: TextFonts.textSimple(
                                      fontSize: 10.sp,
                                      color: Colors.grey.withOpacity(0.8)),
                                )
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.grey.withOpacity(0.8),
                                  size: 2.h,
                                ),
                                width(1),
                                Text(
                                  "$timeAgo",
                                  style: TextFonts.textW5(
                                      color: Colors.grey.withOpacity(0.8),
                                      fontSize: 9.sp),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
                height(2),
                Container(
                  margin: EdgeInsets.only(left: 2.h, right: 2.h, bottom: 1.h),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x23000000),
                        blurRadius: 5.42,
                        offset: Offset(0, 0.90),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(0.5.h),
                  child: TextFormField(
                    focusNode: messageNode,
                    controller: messageController,
                    decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                                child: Text(
                              "Post",
                              style:
                                  TextFonts.textW5(color: AppColors.mainColor),
                            )),
                          ],
                        ),
                        hintStyle: TextFonts.textW5(
                            color: Colors.grey.withOpacity(0.8)),
                        hintText: "Add a comment...",
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        prefixIcon: Container(
                            height: 3.h,
                            width: 6.w,
                            margin: EdgeInsets.only(right: 3.w),
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(ImagesPaths.demo))),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
