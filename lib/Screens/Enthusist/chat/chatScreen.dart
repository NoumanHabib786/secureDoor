import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';
import 'package:sizer/sizer.dart';

import '../../../Provider/chatProvider.dart';
import '../../../resources/appColors.dart';
import '../../../resources/components/Buttons.dart';
import '../../../resources/fonts.dart';
import '../../../resources/height_width.dart';
import '../../../resources/imagesFolder.dart';

class ChatMessage {
  final String text;
  bool isMe;

  ChatMessage({
    required this.text,
    required this.isMe,
  });
}

class ChatScreen extends StatefulWidget {
  String? enthuId;
  String? profId;
  String? role;
  String? enthuName;
  String? profName;
  String? profImage;

  int? enthuIncrement;
  int? profIncrement;

  ChatScreen({
    Key? key,
    this.profId,
    this.enthuId,
    this.role,
    this.enthuName,
    this.profImage,
    this.profName,
    this.enthuIncrement,
    this.profIncrement,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _textController = TextEditingController();

  static DateTime returnDateAndTimeFormat(String time) {
    var dt = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    return DateTime(dt.year, dt.month, dt.day);
  }

  static String groupMessageDateTime(String time) {
    var dt = DateTime.fromMillisecondsSinceEpoch(int.parse(time));

    final todayDate = DateTime.now();
    final today = DateTime(todayDate.year, todayDate.month, todayDate.day);
    final yesturday =
        DateTime(todayDate.year, todayDate.month, todayDate.day - 1);

    String diffrence = '';
    final aDate = DateTime(dt.year, dt.month, dt.day);

    if (aDate == today) {
      diffrence = 'Today';
    } else if (aDate == yesturday) {
      diffrence = 'Yesterday';
    } else {
      diffrence = DateFormat.yMMMd().format(dt).toString();
    }

    return diffrence;
  }

  List<ChatMessage> chatMessages = [];

  List yes = ["Yes", "Yeah Ok", "Sure", "Ok", "👍"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update();
    if (messages.isNotEmpty) {
      _scrollController.addListener(() {
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      });
    }
  }

  update() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.role == 'therapist') {
        print("in update");
        FirebaseFirestore.instance
            .collection("chat")
            .doc("${widget.profId} | ${widget.enthuId}")
            .update({"therapistNoMessages": 0}).then((value) {
          print("updated therapist messages");
        }).onError((error, stackTrace) {
          print(error);
          print("error in");
        });
      } else {
        print("in update else");
        FirebaseFirestore.instance
            .collection("chat")
            .doc("${widget.profId} | ${widget.enthuId}")
            .update({"patientNoMessages": 0}).then((value) {
          print("updated patient messages");
        }).onError((error, stackTrace) {
          print(error);
          print("error");
        });
      }
    });
  }

  List<QueryDocumentSnapshot> messages = [];

  Widget _buildTextComposer() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
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
            child: TextField(
              controller: _textController,
              maxLines: 5,
              minLines: 1,
              scribbleEnabled: true,
              decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.only(left: 5.w),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintStyle:
                      TextFonts.textSimple(color: Colors.grey.withOpacity(0.7)),
                  hintText: "Write Message"),
            ),
          ),
        ),
        width(3),
        Consumer<ChatProvider>(
          builder: (context, sendMessage, child) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.mainColor),
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.paperplane_fill,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (_textController.text.isNotEmpty) {
                    sendMessage.chatCollection(
                        enthuNoMessage: widget.enthuIncrement ?? 0,
                        profNoMessage: widget.profIncrement ?? 0,
                        enthuId: widget.enthuId,
                        lastMessage: _textController.text,
                        message: _textController.text,
                        enthuName: widget.enthuName,
                        role: widget.role,
                        profImage: widget.profImage,
                        profName: widget.profName,
                        professionalId: widget.profId);
                    _textController.clear();
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      {
                        _scrollController
                            .jumpTo(_scrollController.position.minScrollExtent);
                      }
                    });
                    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                    setState(() {});
                  }
                },
              ),
            );
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // titleSpacing: 25.w,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                height: 7.h,
                width: 10.w,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: widget.role == "professional"
                    ? Image.asset(ImagesPaths.demo)
                    : ImagesFolder.getImage(
                        url: "${ImagesFolder.therapist}${widget.profImage}"),
              ),
              width(2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.role == "professional"
                        ? "${widget.enthuName}"
                        : "Specialist ${widget.profName}",
                    maxLines: 1,
                    style: TextFonts.textW8(
                        fontSize: 12.sp, color: AppColors.mainColor),
                  ),
                  // Text(
                  //   "Active Now",
                  //   style: TextFonts.textW5(fontSize: 10.sp),
                  // )
                ],
              ),
              Spacer()
            ],
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.left_chevron,
              size: 2.5.h,
              color: AppColors.mainColor,
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 5.w),
              child: const Icon(
                Icons.more_vert,
                color: AppColors.mainColor,
              ),
            )
          ],
        ),
        bottomSheet: ButtonsClass.bottomSheet(child: _buildTextComposer()),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("chat")
              .doc("${widget.profId} | ${widget.enthuId}")
              .collection("messages")
              .orderBy("timeStemp", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data?.docs.map((e) {
                return e['message'];
              }));
              messages = snapshot.data?.docs
                      .map((e) => e)
                      .cast<QueryDocumentSnapshot>()
                      .toList() ??
                  [];
              if (messages.isNotEmpty) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  {
                    _scrollController
                        .jumpTo(_scrollController.position.minScrollExtent);
                  }
                });
              }
              update();
              return Column(
                children: <Widget>[
                  Divider(
                    height: 1.0,
                    endIndent: 10,
                    indent: 10,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  messages!.isEmpty
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              height(10),
                              Padding(
                                padding: EdgeInsets.all(2.h),
                                child: Text(
                                  "No Message",
                                  style: MessageFonts.notifyW5(),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Flexible(
                          child: ListView.builder(
                            controller: _scrollController,
                            padding: EdgeInsets.zero,
                            reverse: true,
                            itemCount: messages.length,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              print(index == messages.length);
                              print("index == messages.length");
                              // if (index <= messages.length) {
                              //   return height(10);
                              // }
                              bool isSameDate = false;
                              String? newDate = '';
                              if (messages.isNotEmpty) {
                                // final DateTime date = returnDateAndTimeFormat(messages[index]['timeStamp'].toString());

                                if (index == 0 && messages.length == 1) {
                                  newDate = groupMessageDateTime(messages[index]
                                              ['timeStemp']
                                          .toString())
                                      .toString();
                                } else if (index == messages.length - 1) {
                                  newDate = groupMessageDateTime(messages[index]
                                              ['timeStemp']
                                          .toString())
                                      .toString();
                                } else {
                                  final DateTime date = returnDateAndTimeFormat(
                                      messages[index]['timeStemp'].toString());
                                  final DateTime prevDate =
                                      returnDateAndTimeFormat(
                                          messages[index + 1]['timeStemp']
                                              .toString());
                                  isSameDate = date.isAtSameMomentAs(prevDate);

                                  print("$date $prevDate $isSameDate");

                                  newDate = isSameDate == true
                                      ? ''
                                      : groupMessageDateTime(messages[index]
                                                  ['timeStemp']
                                              .toString())
                                          .toString();
                                }
                              }
                              var message = messages[index];
                              print(message['sender']);
                              print("message['sender']");
                              print(
                                  "${DateTime.now().subtract(Duration(days: 2)).millisecondsSinceEpoch}");
                              return widget.role == message['sender']
                                  ? Column(
                                      children: [
                                        if (newDate.isNotEmpty)
                                          Center(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffE3D4EE),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(newDate),
                                                  ))),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 40.w,
                                              top: 1.h,
                                              bottom: 1.h,
                                              right: 3.w),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.h,
                                                      vertical: 1.h),
                                                  decoration:
                                                      const ShapeDecoration(
                                                    color: AppColors.mainColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                      ),
                                                    ),
                                                    shadows: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x23000000),
                                                        blurRadius: 3,
                                                        offset: Offset(0, 1),
                                                        spreadRadius: 0,
                                                      )
                                                    ],
                                                  ),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      message['message'],
                                                      style: TextFonts.textW5(
                                                          fontSize: 11.sp,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                height(1),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    DateFormat.jm().format(DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            message[
                                                                'timeStemp'])),
                                                    style: TextFonts.textSimple(
                                                        fontSize: 9.sp,
                                                        color: Colors.black
                                                            .withOpacity(0.5)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        if (newDate.isNotEmpty)
                                          Center(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffE3D4EE),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(newDate),
                                                  ))),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 30.w,
                                              top: 1.h,
                                              bottom: 1.h,
                                              left: 3.w),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 7.h,
                                                width: 10.w,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: widget.role ==
                                                        "professional"
                                                    ? Image.asset(
                                                        ImagesPaths.demo)
                                                    : ImagesFolder.getImage(
                                                        url:
                                                            "${ImagesFolder.patients}${widget.profImage}"),
                                              ),
                                              width(2),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.h,
                                                              vertical: 1.h),
                                                      decoration:
                                                          const ShapeDecoration(
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                        ),
                                                        shadows: [
                                                          BoxShadow(
                                                            color: Color(
                                                                0x23000000),
                                                            blurRadius: 3,
                                                            offset:
                                                                Offset(0, 1),
                                                            spreadRadius: 0,
                                                          )
                                                        ],
                                                      ),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          message['message'],
                                                          style:
                                                              TextFonts.textW5(
                                                                  fontSize:
                                                                      11.sp,
                                                                  color: Colors
                                                                      .black54),
                                                        ),
                                                      ),
                                                    ),
                                                    height(1),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        DateFormat.jm().format(DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                message[
                                                                    'timeStemp'])),
                                                        style: TextFonts
                                                            .textSimple(
                                                                fontSize: 9.sp,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.5)),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                            },
                          ),
                        ),
                  height(10),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Something wrong",
                  style: TextFonts.textW5(),
                ),
              );
            } else if (!snapshot.hasData) {
              print("No data");
              return SingleChildScrollView(
                child: Column(
                  children: [
                    height(10),
                    Padding(
                        padding: EdgeInsets.all(2.h),
                        child: Text(
                          "No Message",
                          style: MessageFonts.notifyW5(),
                        )),
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: loading());
            }
            return Container();
          },
        ));
  }
}
