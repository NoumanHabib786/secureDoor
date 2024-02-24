import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:secure_fitness_comp/Provider/chatProvider.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import '../../../resources/appColors.dart';
import '../../../resources/components/Buttons.dart';
import '../../../resources/components/appbar.dart';
import '../../../resources/imagesFolder.dart';
import '../../../resources/imagesPaths.dart';
import '../../../utils/Routes/RoutesName.dart';
import 'chatScreen.dart';

class MainChatScreen extends StatefulWidget {
  const MainChatScreen({Key? key}) : super(key: key);

  @override
  State<MainChatScreen> createState() => _MainChatScreenState();
}

class _MainChatScreenState extends State<MainChatScreen> {
  bool anyMessage = false;

  bool isProfessional = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var chatController = TextEditingController();
  List<QueryDocumentSnapshot> chats = [];
  List<QueryDocumentSnapshot> filterChats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: app_bar(context: context, title: "Messages", isAuto: true),
        body: SizedBox(
            width: double.maxFinite,
            height: double.infinity,
            child: Consumer<ChatProvider>(
              builder: (context, value, child) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 58,
                          margin: EdgeInsets.all(2.h),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14.45, vertical: 10.84),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.03),
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
                          child: TextFormField(
                            controller: chatController,
                            onChanged: (value) {
                              setState(() {
                                if (value.isEmpty) {
                                  filterChats = [];
                                } else {
                                  filterChats = chats.where((element) {
                                    var name = element[isProfessional
                                            ? 'enthuName'
                                            : "profName"]
                                        .toString()
                                        .toLowerCase();
                                    return name.contains(value.toLowerCase());
                                  }).toList();
                                }
                              });
                            },
                            style: const TextStyle(
                                fontFamily: "avenir", fontSize: 14),
                            decoration: InputDecoration(
                                prefixIcon: Icon(CupertinoIcons.search),
                                hintText: "Search...",
                                hintStyle:
                                    MessageFonts.notifyW5(fontSize: 12.sp),
                                disabledBorder: InputBorder.none,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                        StreamBuilder(
                          stream: value.chat
                              .where(!isProfessional ? "profId" : "enthuId",
                                  isEqualTo:
                                      !isProfessional ? "2" : "1")
                              .orderBy(descending: true, "timeStemp")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              print(snapshot.data?.docs
                                  .map((e) => e['lastMessage']));
                              print("here data");
                              chats = snapshot.data?.docs
                                      .cast<QueryDocumentSnapshot>()
                                      .toList() ??
                                  [];
                              // filterChats = chats;
                              return filterChats.isEmpty &&
                                          chatController.text.isNotEmpty ||
                                      chats.isEmpty
                                  ? Expanded(
                                      child: InkWell(
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: Text(
                                              "No message",
                                              style: MessageFonts.notifyW5(),
                                            )),
                                      ),
                                    )
                                  : Expanded(
                                      child: ListView.builder(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.h),
                                          itemBuilder: (context, index) {
                                            var chat;
                                            if (filterChats.isEmpty) {
                                              chat = chats[index];
                                            } else {
                                              chat = filterChats[index];
                                            }
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 1.h),
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                shadows: const [
                                                  BoxShadow(
                                                    color: Color(0x23000000),
                                                    blurRadius: 6,
                                                    offset: Offset(0, 1),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                              ),
                                              child: ListTile(
                                                onTap: () {
                                                  RoutesName.push2(
                                                      context,
                                                      ChatScreen(
                                                        enthuIncrement: chat[
                                                                'enthuNoMessages'] ??
                                                            0,
                                                        profIncrement: chat[
                                                                'profNoMessages'] ??
                                                            0,
                                                        profName:
                                                            chat['profName'],
                                                        profImage:
                                                            chat['profImage'],
                                                        profId: chat['profId'],
                                                        enthuName:
                                                            chat['enthuName'],
                                                        enthuId:
                                                            chat['enthuId'],
                                                        role: isProfessional
                                                            ? "professional"
                                                            : "enthusist",
                                                      ));
                                                },
                                                tileColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                trailing: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 4.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        DateFormat.jm().format(DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                chat[
                                                                    'timeStemp'])),
                                                        style: ButtonFonts
                                                            .btnSimple(
                                                                fontSize: 8.sp,
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.7)),
                                                      ),
                                                      const Spacer(),
                                                      Visibility(
                                                        visible: isProfessional
                                                            ? chat['profNoMessages'] !=
                                                                    null
                                                                ? chat['profNoMessages'] ==
                                                                        0
                                                                    ? false
                                                                    : true
                                                                : false
                                                            : chat['enthuNoMessages'] !=
                                                                    null
                                                                ? chat['enthuNoMessages'] ==
                                                                        0
                                                                    ? false
                                                                    : true
                                                                : false,
                                                        child: Container(
                                                          height: 3.6.h,
                                                          width: 4.w,
                                                          // padding: EdgeInsets.all(10),
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: AppColors
                                                                      .mainColor),
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          child: Text(
                                                            isProfessional
                                                                ? chat['profNoMessages'] !=
                                                                        null
                                                                    ? "${chat['profNoMessages']}"
                                                                    : "0"
                                                                : chat['enthuNoMessages'] !=
                                                                        null
                                                                    ? "${chat['enthuNoMessages']}"
                                                                    : "0",
                                                            style: TextFonts
                                                                .textW6(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        8.sp),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.all(0.5.h),
                                                visualDensity:
                                                    const VisualDensity(
                                                        vertical: -4),
                                                title: Text(
                                                  isProfessional
                                                      ? "${chat['enthuName']}"
                                                      : "${chat['profName']}",
                                                  style: ButtonFonts.btnW7(
                                                      fontSize: 12.sp,
                                                      color: Colors.black),
                                                ),
                                                subtitle: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4.0),
                                                  child: Text(
                                                    "${chat['lastMessage']}",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        ButtonFonts.btnSimple(
                                                            fontSize: 10.sp,
                                                            color: Colors.grey),
                                                  ),
                                                ),
                                                leading: Container(
                                                  height: 7.h,
                                                  width: 15.w,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: isProfessional
                                                      ? Image.asset(
                                                          ImagesPaths.demo)
                                                      : ImagesFolder.getImage(
                                                          url:
                                                              "${ImagesFolder.therapist}${chat['profImage']}"),
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount: filterChats.isEmpty
                                              ? chats.length
                                              : filterChats.length));
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  "Something wrong",
                                  style: TextFonts.textW5(),
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: loading());
                            } else if (!snapshot.hasData) {
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    "No message",
                                    style: MessageFonts.notifyW5(),
                                  ));
                            }
                            return Container();
                          },
                        )
                      ],
                    ),
                  ],
                );
              },
            )));
  }
}
