import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/utils/notficationsBar.dart';

class PostProvider with ChangeNotifier {
  var firebase = FirebaseAuth.instance.currentUser;

  final CollectionReference chat =
      FirebaseFirestore.instance.collection('posts');

  bool isUploadingPost = false;

  setIsUploadingPost(bool value) {
    isUploadingPost = value;
    notifyListeners();
  }

  Future<String> postCollection({
    String? userId,
    String? title,
    String? details,
    String? postiImage,
    String? userName,
    String? userImage,
    String? role,
  }) {
    Map<String, dynamic> postData = {
      "timeStemp": DateTime.now().millisecondsSinceEpoch,
      "userId": userId,
      "docId": "",
      "title": title,
      "details": details,
      "postiImage": postiImage,
      "userName": userName,
      "userImage": userImage,
      "role": role,
    };

    var message = chat.add(postData).then((value) {
      value.update({"docId": value.id});
      setIsUploadingPost(false);
      return 'success';
    }).onError((error, stackTrace) {
      setIsUploadingPost(false);
      return 'error';
    });
    return message;
  }

  Future<String?> upLoadImage(String post, BuildContext context) async {
    setIsUploadingPost(true);
    try {
      final path = 'postImages/${post.split('/').last.split(".").first}';
      log(path);
      final ref = FirebaseStorage.instance.ref().child(path);
      log(ref.toString());
      UploadTask putFile = ref.putFile(File(post));
      putFile.asStream().listen((event) {
        log(event.totalBytes.toString());
        log(event.bytesTransferred.toString());
      });
      final snapshot = await putFile.whenComplete(() {});
      final url = snapshot.ref.getDownloadURL();
      log(url.toString());
      return url;
    } catch (e) {
      setIsUploadingPost(false);

      Utils.toastMessage("$e");
      throw e;
    }
  }
}
