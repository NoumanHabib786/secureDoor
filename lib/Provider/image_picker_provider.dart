import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secure_fitness_comp/utils/notficationsBar.dart';

class ImagePickerProvider extends ChangeNotifier{
  Future pickSignupProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      File? img = File(image.path);
      // img = await cropImage(imageFile: img);
      // getSignupProfileImage = img;
      notifyListeners();
      return img;
    } on PlatformException catch (e) {
      print(e);
    }
  }
  List<PlatformFile> selectedFiles = [];
  Future<List<PlatformFile>> businessDocumentSelectFun({context}) async {
    // Check if the maximum limit of 10 files is reached
    if (selectedFiles.length >= 3) {
      // Show a message or handle the case where the user exceeds the limit
      print('Maximum limit reached (4 files)');
      Utils.flushBarErrorMessage("Maximum limit reached (4 files)",context);
      return selectedFiles;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true, // Allow users to pick multiple files
    );

    if (result != null && result.files.isNotEmpty) {
      // Check if the total number of selected files is within the limit
      if (selectedFiles.length + result.files.length > 4) {
        // Show a message or handle the case where the user exceeds the limit
        print('Maximum limit exceeded (4 files)');
        Utils.flushBarErrorMessage("Maximum limit reached (4 files)",context);
      } else {
        selectedFiles.addAll(result.files);
      }
    }
    notifyListeners();
    return selectedFiles;
  }
  businessDocumentRemoveFun({required int index}){
    print("index $index");
    selectedFiles.removeAt(index);
    notifyListeners();
  }
}