import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotification {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  bool isFlutterLocalNotificationsInitialized = false;
  AndroidNotificationChannel? channel;
  Future<void> mSetupLocalNotificationChannel() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    /// Create an Android Notification Channel.
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    print("mSetupLocalNotificationChannel-->");
    print("request for firebase push notification permission-->");
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      sound: true,
      badge: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();

    // Update the iOS foreground notification presentation options to allow
    // heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );

    isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> mSetupNotificationChannel() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
      'This channel is used for important notifications.', // description
      importance: Importance.high,

    );

    /// Create an Android Notification Channel.
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    // Update the iOS foreground notification presentation options to allow
    // heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> mRequestNotificationPermissions() async {
    print('nPermissionRequest-->');
    print("request for firebase push notification permission-->");
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      sound: true,
      badge: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );
    print("request complete");
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  String? _getImageUrl(RemoteNotification notification) {
    if (Platform.isIOS && notification.apple != null) {
      return notification.apple?.imageUrl;
    }
    if (Platform.isAndroid && notification.android != null) {
      return notification.android?.imageUrl;
    }
    return null;
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  bool isBlank(String? s) => s == null || s.trim().isEmpty;
  Future<StyleInformation?> notificationStyle(RemoteMessage message) async {
    String? nType = message.data['type'];
    StyleInformation? styleInformation;

    if (!isBlank(nType) && nType == 'BIGTEXT') {
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );
      styleInformation = bigTextStyleInformation;
    }

    if (!isBlank(nType) && nType == 'BIGPIC') {
      String? bigPicURL = _getImageUrl(message.notification!);
      if (isBlank(bigPicURL)) {
        bigPicURL = 'https://tinyurl.com/2zkrd2rb';
        print("bigPicURL-->$bigPicURL");
      }

      String? bigPicPath = await _downloadAndSaveFile(bigPicURL!, 'bigPicture');

      ///final String largeIconPath = await _downloadAndSaveFile('https://dummyimage.com/48x48', 'largeIcon');
      BigPictureStyleInformation bigPictureStyleInformation =
      BigPictureStyleInformation(FilePathAndroidBitmap(bigPicPath),
          contentTitle: message.notification!.title,
          htmlFormatContentTitle: true,
          summaryText: message.notification!.body,
          htmlFormatSummaryText: true,
          largeIcon: FilePathAndroidBitmap(bigPicPath));
      styleInformation = bigPictureStyleInformation;
    }
    return styleInformation;
  }

  void mSetupFirebaseNotificationService() {
    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
          (message) async {
        print("FirebaseMessaging.onMessage.listen");

        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");

          createAndDisplayForegroundLocalNotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['imageUrl']}");
        }
      },
    );
  }

  mInitializeLocalNotification() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (id) async {
        print("onSelectNotification");
        if (id != null) {
          print("Router Value1234 $id");

          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => DemoScreen(
          //       id: id,
          //     ),
          //   ),
          // );

        }
      },

      ///onDidReceiveBackgroundNotificationResponse: (id)async{}
    );
  }

  void createAndDisplayForegroundLocalNotification(
      RemoteMessage message) async {

    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel', // id
          'High Importance Notifications', // title
          //channelShowBadge: true,///
          importance:Importance.max ,
          priority:  Priority.high,
          enableVibration: true,
          visibility:  NotificationVisibility.public ,
          ///  sound: RawResourceAndroidNotificationSound('nsound'),  ///play custom notification sound
          playSound: true,
          largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
          styleInformation: await notificationStyle(message),
        ),
      );

      await flutterLocalNotificationsPlugin.show(
        id,
        "${message.notification!.title}",
        "${message.notification!.body}",
        notificationDetails,
        payload: message.data['imageUrl'],
      );
    } on Exception catch (e) {
      print(
          "Error CreateAndDisplayForegroundLocalNotification-->${e.toString()}");
    }
  }

  Future _getFCMToken() async {
    String fcmToken = '';
    if (!kIsWeb) {
      try {
        FirebaseMessaging fcm = FirebaseMessaging.instance;
        fcmToken = await fcm.getToken() ?? "";
      } on FirebaseException catch (e) {
        debugPrint('fcmToke error-->${e.code}');
      }
      debugPrint('fcmToke$fcmToken');
      return fcmToken;
    }
  }

  updateFCMToken(String? userId) async {
    String token = await _getFCMToken();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId ?? FirebaseAuth.instance.currentUser?.uid)
        .update({'token': token});
    print('token updated');
    print('token-->${token}');
    print('local userId-->${userId}');
    print('FirebaseAuth userId-->${FirebaseAuth.instance.currentUser?.uid}');
  }

  Future<void> sendPushMessage(
      {required String token,
        required String title,
        required String topic,
        required String message,
        required String clickAction}) async {
    if (token == null || token.isEmpty) {
      print('Unable to send FCM message, no token exists.');
      return;
    }

    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=AAAASxUtBJI:APA91bEDhkEZyVVXMGyt0Ym6RTB-_9zjqH4mxz7njO9BFwxlfwGw3EObOOrUpy6-CfmLbW_pkHmkuiXzM1fn9IRvNSdMOaTEjmyVwL9oDiWf9ZA22Fnvazy_6ZPD_6sx3sG9vzVb0V24',
        },
        body: constructFCMPayload(token, title, message, clickAction, topic),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }

  /// The API endpoint here accepts a raw FCM payload for demonstration purposes.
  String constructFCMPayload(
      String token, String title, String message, String clickAction, topic) {
    // _messageCount++;
    return jsonEncode({
      // "registration_ids": [
      //   "ceZ1t5QzQ3a5zAO4_FaJPO:APA91bEcylTpwTIxNrTCCvlluLO_joCDymxfzX9o1G9CQ0-MrIFit2wb6G_PgxM-tVmalZ1XlO4A0lNDAhf3wTMGWwJM6FH_5B9KgN_z7c9fcy07udx3sE-c4BFaxw6Qo1mq-FF6SxGS"
      // ],
      'to': "/topics/$topic",
      "data": {
        "via": 'Cloud Messaging!!!',
        "count": 1.toString(),
        "click_action": clickAction,
        //"imageUrl": "https://cdn.pixabay.com/photo/2013/05/11/08/28/sunset-110305_960_720.jpg",
      },
      "notification": {
        "title": title,
        "body": message,
        // "content_available": true,
        // "mutable_content": true,
        // "android_channel_id": "high_importance_channel",
        // "sound": "nsound.wav",
      },
    });
  }
}



// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/http.dart' as http;
// import 'package:ubee_live/constants/constants.dart';
// import 'package:ubee_live/main.dart';

// class PushNotification {
//   FirebaseMessaging fcm = FirebaseMessaging.instance;
//   FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
//   AndroidNotificationChannel? channel;

//   /// Create a [AndroidNotificationChannel] for heads up notifications

//   bool isFlutterLocalNotificationsInitialized = false;
//   void initialize() {
//     BuildContext? context = navigatorKey.currentContext;
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       // if (message == null) {
//       //   return;
//       // } else {
//       showFlutterNotification(message);

//       // }
//     });

//     // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     //   final payloadData= message.data;
//     //   // AppUtils.pushRoute(context: Constants.mainNavigatorKey.currentContext!, route: ChatScreen());
//     //   // message.data.forEach((key, value) {
//     //   if( payloadData[1].toString() != null  || payloadData[1] == "chat_screen"){
//     //     //   AppUtils.pushRoute(context: Constants.mainNavigatorKey.currentContext!, route: ChatScreen());
//     //     // }
//     //     //   AppUtils
//     //     //       .pushAndRemove(
//     //     //       context:
//     //     //       context,screenName: ChatScreen());
//     //       if(AppUtils.isConsumerAccountLogin()){
//     //         AppUtils
//     //             .pushAndRemove(
//     //             context:
//     //             Constants.mainNavigatorKey.currentContext!,
//     //             screenName: AppBottomBar(
//     //                 bottomBarPages: [
//     //                   //    DashboardScreen(),
//     //                   DashboardScreen(),
//     //                   ChatScreen(),
//     //                   BookingMainScreen(),
//     //                   NavDrawer(),
//     //                 ]));
//     //       }else if(AppUtils.isProviderAccountLogin()){
//     //         AppUtils
//     //             .pushAndRemove(
//     //             context:
//     //             Constants.mainNavigatorKey.currentContext!,
//     //             screenName: AppBottomBar(
//     //                 providerUser:
//     //                 true,
//     //                 bottomBarPages: [
//     //                   ProviderDashboardScreen(),
//     //                   ProviderChatScreen(),
//     //                   ProviderSideBookingScreen(),
//     //                   NavDrawer(),
//     //                 ]));
//     //       }
//     //     }
//     //   // });
//     //   debugPrint(
//     //       'A new onMessageOpenedApp event was published!' + message.toString());
//     //   // showDialog(
//     //   //     context: context!,
//     //   //     builder: (contextBuilder) => ShowPopup(
//     //   //       title: title != null ? title : "Error!",
//     //   //       description: message.notification?.body??"",
//     //   //       actions: [
//     //   //         AppAlertAction(
//     //   //           title: "Title" ?? "Ok",
//     //   //           handler: (_){
//     //   //             AppUtils.pop(context: contextBuilder);
//     //   //           },
//     //   //           showWhiteButton: false,
//     //   //         ),
//     //   //       ],
//     //   //     barrierDismissible: true));
//     // });
//   }

//   void showFlutterNotification(RemoteMessage message) {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//     if (notification != null && android != null && !kIsWeb) {
//       flutterLocalNotificationsPlugin?.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel?.id ?? "",
//             channel?.name ?? "",
//             channelDescription: channel?.description,
//             importance: Importance.high,
//             // TODO add a proper drawable resource to android, for now using
//             //      one that already exists in example app.
//             // icon: 'launch_background',
//             largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
//           ),
//         ),
//       );
//     }
//   }

//   void requestPermissions() {
//     flutterLocalNotificationsPlugin
//         ?.resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//     flutterLocalNotificationsPlugin
//         ?.resolvePlatformSpecificImplementation<
//             MacOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }

//   Future<void> setupFlutterNotifications() async {
//     print('Handling a background message...}');

//     if (isFlutterLocalNotificationsInitialized) {
//       return;
//     }
//     channel = const AndroidNotificationChannel(
//       'high_importance_channel', // channel id
//       'High Importance Notifications', // title
//       description:
//           'This channel is used for important notifications.', // description
//       importance: Importance.high,
//     );

//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     /// Create an Android Notification Channel.
//     /// We use this channel in the `AndroidManifest.xml` file to override the
//     /// default FCM channel to enable heads up notifications.
//     await flutterLocalNotificationsPlugin
//         ?.resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel!);

//     /// Update the iOS foreground notification presentation options to allow
//     /// heads up notifications.
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     isFlutterLocalNotificationsInitialized = true;
//   }

//   Future<void> sendPushMessage({required String token,required  String senderName, required  String message,
//       String? clickAction}) async {
//     if (token == null) {
//       print('Unable to send FCM message, no token exists.');
//       return;
//     }

//     try {
//       await http.post(
//         Uri.parse('https://fcm.googleapis.com/fcm/send'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Authorization':
//               'key=$fcmKey',
//         },
//         body: constructFCMPayload(token, senderName, message, clickAction ?? ""),
//       );
//       print('FCM request for device sent!');
//     } catch (e) {
//       print(e);
//     }
//   }

//   /// The API endpoint here accepts a raw FCM payload for demonstration purposes.
//   String constructFCMPayload(
//       String? token, String senderName, String message, String clickAction) {
//     return jsonEncode({
//       "registration_ids": [token],
//       "data": {
//         "via": "FlutterFire Cloud Messaging!!!",
//         "count": 1.toString(),
//         "click_action": clickAction ?? "",
//       },
//       'notification': {
//         'title': "senderName",
//         'body': "message",
//       },
//     });
//   }
// }
