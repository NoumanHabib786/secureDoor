import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/Provider/auth_provider.dart';
import 'package:secure_fitness_comp/Provider/postsProvider.dart';
import 'package:secure_fitness_comp/resources/appColors.dart';
import 'package:secure_fitness_comp/resources/buttons.dart';
import 'package:secure_fitness_comp/resources/components/Buttons.dart';
import 'package:secure_fitness_comp/resources/components/appbar.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:secure_fitness_comp/resources/height_width.dart';
import 'package:secure_fitness_comp/resources/textfield.dart';
import 'package:secure_fitness_comp/utils/notficationsBar.dart';
import 'package:sizer/sizer.dart';

class AddAcheivementsScreen extends StatefulWidget {
  const AddAcheivementsScreen({Key? key}) : super(key: key);

  @override
  State<AddAcheivementsScreen> createState() => _AddAcheivementsScreenState();
}

class _AddAcheivementsScreenState extends State<AddAcheivementsScreen> {
  File? image;

  Future pickImage() async {
    try {
      final pickImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickImage == null) return;
      setState(() {
        image = File(pickImage.path);
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  var titleController = TextEditingController();
  var detailsController = TextEditingController();

  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomSheet: ButtonsClass.bottomSheet(
          child: Consumer2<PostProvider, AuthenProvider>(
        builder: (context, value, userData, child) {
          return ButtonsClass.buildFillButton(
            context: context,
            btnColor: AppColors.mainColor,
            btnName: "Post",
            isLoading: value.isUploadingPost,
            function: () {
              if (key.currentState!.validate()) {
                if (image == null) {
                  value
                      .postCollection(
                          title: titleController.text,
                          userId: userData.enthusistModel?.userId,
                          details: detailsController.text,
                          role: userData.enthusistModel?.accountType,
                          userName: userData.enthusistModel?.name)
                      .then((success) {
                    if (success == 'success') {
                      titleController.clear();
                      setState(() {
                        detailsController.clear();
                      });
                      Utils.flushBarSuccessMessage(
                          "Post successfully", context);
                    }
                  });
                } else {
                  value.upLoadImage(image!.path, context).then((imageValue) {
                    value
                        .postCollection(
                            title: titleController.text,
                            postiImage: imageValue,
                            role: userData.enthusistModel?.accountType,
                            userId: userData.enthusistModel?.userId,
                            details: detailsController.text,
                            userName: userData.enthusistModel?.name)
                        .then((success) {
                      if (success == 'success') {
                        titleController.clear();
                        setState(() {
                          detailsController.clear();
                        });
                        setState(() {
                          image = null;
                        });
                        Utils.flushBarSuccessMessage(
                            "Post successfully", context);
                      }
                    });
                    ;
                  });
                }
              }
            },
          );
        },
      )),
      appBar:
          app_bar(context: context, title: "Post Achievements", isAuto: true),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    pickImage();
                  },
                  child: Container(
                    height: 25.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12)),
                    child: image == null
                        ? Center(
                            child: Text(
                              "Upload Image",
                              style: MessageFonts.notifySimple(),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              image!.absolute,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                height(5),
                textField(
                  hintText: "Title",
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Please enter your achievement";
                    }
                    return null;
                  },
                  controller: titleController,
                ),
                height(2),
                textField(
                  hintText: "Detials",
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Please describe your achievements";
                    }
                    return null;
                  },
                  maxLine: 5,
                  padding: EdgeInsets.all(1.h),
                  controller: detailsController,
                ),
                height(7)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
