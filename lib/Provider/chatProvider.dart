import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../utils/pushNotify.dart';

class ChatProvider with ChangeNotifier {

  var firebase = FirebaseAuth.instance.currentUser;

  final CollectionReference chat =
  FirebaseFirestore.instance.collection('chat');

  //---------------------------Chat-Start-Working---------------------------------

  chatCollection({
    String? professionalId,
    String? enthuId,
    String? profImage,
    String? lastMessage,
    String? enthuName,
    String? profName,
    String? message,
    String? role,
    int? profNoMessage,
    int? enthuNoMessage,
  }) {
    Map<String, dynamic> messageData = {
      "timeStemp": DateTime.now().millisecondsSinceEpoch,
      "message": message,
      "sender": role
    };
    Map<String, dynamic> outerData = {
      "timeStemp": DateTime.now().millisecondsSinceEpoch,
      "profId": professionalId,
      "enthuId": enthuId,
      "profImage": profImage,
      "lastMessage": lastMessage,
      "enthuName": enthuName,
      "profName": profName,
      "profNoMessages": profNoMessage,
      "enthuNoMessages": enthuNoMessage
    };
    print(enthuNoMessage);
    print(profNoMessage);
    print("patNoMessage");
    PushNotification notify = PushNotification();
    chat
        .doc("$professionalId | $enthuId")
        .collection("messages")
        .add(messageData)
        .then((value) {
      if (role == "professional") {
        print("send notify patient");
        notify.sendPushMessage(
            token: "${value.id}",
            title: "New message from $profName",
            topic: "chat$enthuId",
            message: "$message",
            clickAction: "");
      } else {
        print("send notify therapist");

        notify.sendPushMessage(
            token: "${value.id}",
            title: "New message from $enthuName",
            topic: "chat$professionalId",
            message: "$message",
            clickAction: "");
      }
    });
    var chatDoc = chat.doc("$professionalId | $enthuId");

    FirebaseFirestore.instance.runTransaction((transaction) async {
      // Get the current snapshot of the document
      var docSnapshot = await transaction.get(chatDoc);
      var data = docSnapshot.data() as Map;

      // Update the messages collection
      // var newMessageDoc = chatDoc.collection("messages").doc();
      // transaction.set(newMessageDoc, messageData);

      // Update the outer data
      transaction.set(chatDoc, outerData);

      // Increment message counters based on role
      if (role == "professional") {
        transaction.update(chatDoc, {
          "enthuNoMessages": (data['enthuNoMessages'] ?? 0) + 1,
        });
      } else {
        transaction.update(chatDoc, {
          "profNoMessages": (data['profNoMessages'] ?? 0) + 1,
        });
      }
    }).catchError((error) {
      print("Transaction failed: $error");
      chat.doc("$professionalId | $enthuId").set(outerData);

    });
  }

//-------------------------------Chat-Working-End-------------------------------

}