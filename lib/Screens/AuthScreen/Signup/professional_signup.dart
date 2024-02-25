
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';
import 'package:secure_fitness_comp/utils/notficationsBar.dart';

import '../../../Provider/auth_provider.dart';
import '../../../Provider/image_picker_provider.dart';
import '../../../resources/buttons.dart';
import '../../../resources/color.dart';
import '../../../resources/sizedbox.dart';
import '../../../resources/textStyle.dart';

class ProfessionalSignupScreen extends StatefulWidget {
  const ProfessionalSignupScreen({Key? key}) : super(key: key);

  @override
  State<ProfessionalSignupScreen> createState() => _ProfessionalSignupScreenState();
}

class _ProfessionalSignupScreenState extends State<ProfessionalSignupScreen> {
  File? userImage;
  String? selectedSpecializationValue;
  String? selectedExperienceValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<AuthenProvider>(context,listen: false);
      setState(() {
        provider.startTime = null;
        provider.endTime = null;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final scrSize = MediaQuery.of(context).size;
    return Consumer2<AuthenProvider,ImagePickerProvider>(
        builder: (context,provider,imagePicker,_){
          return  Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: kPaddingHorizontal20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizeStatusBar(context: context),
                  signupBackButton(context: context),
                  sizeHeight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          // width: 70.0,
                          height: 4.13,
                          decoration: BoxDecoration(color: Color(0xFF3BABDD)),
                        ),
                      ),
                      sizeWidth10,
                      Expanded(
                        child: Container(
                          // width: 70,
                            height: 4.13,
                            decoration: BoxDecoration(color: Color(0xFF3BABDD))
                        ),
                      ),
                      sizeWidth10,
                      Expanded(
                        child: Container(
                          // width: 70,
                          height: 4.13,
                          decoration: BoxDecoration(color: Color(0xFF3BABDD)),
                        ),
                      ),
                      sizeWidth10,
                      Expanded(
                        child: Container(
                          // width: 70,
                          height: 4.13,
                          decoration: BoxDecoration(color: Color(0xFF3BABDD)),
                        ),
                      ),

                    ],
                  ),
                  sizeHeight20,
                 Expanded(
                   child: SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Professional Information',
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 24,
                             // fontFamily: 'Roboto',
                             fontWeight: FontWeight.w700,
                             height: 0,
                           ),
                         ),
                         sizeHeight10,
                         Text(
                           'Your personal information is essential for tailoring our services to your needs. Please provide accurate details to optimize your fitness journey.',
                           style: TextStyle(
                             color: otherColor,
                             fontSize: 14,
                             fontWeight: FontWeight.w400,
                             height: 0,
                           ),
                         ),
                         sizeHeight20,
                         Text(
                           'Account Image',
                           style: txtStyle14AndBold,
                         ),
                         sizeHeight15,
                         SizedBox(
                           width: scrSize.width,
                           child:
                           userImage != null?
                           SizedBox(
                               width: scrSize.width,
                               height: 250,
                               child: ClipRRect(
                                   borderRadius: BorderRadius.circular(15),
                                   child: Image.file(userImage!,fit: BoxFit.cover,)))
                               :
                           DottedBorder(
                             color: greyColor300,
                             dashPattern: [15,6],
                             // borderType: BorderType.Circle,
                             // borderPadding: EdgeInsets.all(value),
                             radius: Radius.circular(10),
                             // borderType: BorderType,
                             strokeWidth: 1,
                             strokeCap: StrokeCap.round,
                             borderType: BorderType.RRect,
                             // radius: Radius.circular(5),
                             child: SizedBox(
                               width: scrSize.width,
                               child: InkWell(
                                 onTap: (){
                                   setState(() async {
                                     userImage = await imagePicker.pickSignupProfileImage();
                                   });
                                 },
                                 child: Container(
                                   height: 250,
                                   // padding: const EdgeInsets.symmetric(vertical: 80),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Image.asset(ImagesPaths.fileUploadIcon,width: 24,
                                         height: 24,),
                                       sizeHeight10,
                                       Text(
                                         'Upload Image',
                                         style: TextStyle(
                                           color: Color(0xFF97A2AC),
                                           fontSize: 10,
                                           fontWeight: FontWeight.w400,
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ),
                         sizeHeight20,
                         Text(
                           'Certificates',
                           style: txtStyle14AndBold,
                         ),
                         imagePicker.selectedFiles.isEmpty? SizedBox(): sizeHeight15,
                         imagePicker.selectedFiles.isNotEmpty?
                         ListView.builder(
                             itemCount: imagePicker.selectedFiles.length,
                             shrinkWrap: true,
                             physics: NeverScrollableScrollPhysics(),
                             padding: EdgeInsets.zero,
                             itemBuilder: (context,index) {
                               return Container(
                                 // width: 327,
                                 // height: 42.16,
                                 margin: index == 0?EdgeInsets.zero : EdgeInsets.only(top: 10),
                                 decoration: ShapeDecoration(
                                   color: Color(0xFFF3F3F3),
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                 ),
                                 child: ListTile(
                                   leading: Image.asset(ImagesPaths.documentIcon,width: 24,
                                     height: 24,),
                                   minLeadingWidth: 15,
                                   // contentPadding: ,
                                   title: Text(
                                     imagePicker.selectedFiles[index].name,
                                     style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 12,
                                       fontWeight: FontWeight.w400,
                                     ),
                                   ),
                                   contentPadding: EdgeInsets.only(left: 20),
                                   trailing: IconButton(
                                       onPressed:(){
                                         imagePicker.businessDocumentRemoveFun(index: index);
                                       },
                                       icon: Icon(Icons.close,color: textColor,)),
                                 ),
                               );
                             }
                         ) : SizedBox(),
                         sizeHeight15,
                         SizedBox(
                           width: scrSize.width,
                           child: DottedBorder(
                             color: greyColor300,
                             dashPattern: [15,6],
                             // borderType: BorderType.Circle,
                             // borderPadding: EdgeInsets.all(value),
                             radius: Radius.circular(10),
                             // borderType: BorderType,
                             strokeWidth: 1,
                             strokeCap: StrokeCap.round,
                             borderType: BorderType.RRect,
                             // radius: Radius.circular(5),
                             child: SizedBox(
                               width: scrSize.width,
                               child: InkWell(
                                 onTap: (){
                                   imagePicker.businessDocumentSelectFun(context: context);
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(vertical: 20),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Image.asset(ImagesPaths.fileUploadIcon,width: 24,
                                         height: 24,),
                                       sizeHeight10,
                                       Text(
                                         'Upload document',
                                         style: TextStyle(
                                           color: Color(0xFF97A2AC),
                                           fontSize: 10,
                                           fontWeight: FontWeight.w400,
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ),
                         sizeHeight20,
                         Text(
                           'Specialization',
                           style: txtStyle14AndBold,
                         ),
                         sizeHeight15,
                         DropdownButtonHideUnderline(
                           child: SizedBox(
                             width: scrSize.width,
                             child: Container(
                               decoration: BoxDecoration(
                                 borderRadius: kBorderRadius10,
                                 border: Border.all(
                                     color: otherColor,
                                     width: 0.2
                                 ),
                               ),
                               padding: kPaddingHorizontal20,
                               child: DropdownButton<String>(
                                 value: selectedSpecializationValue,
                                 iconEnabledColor: mainColor,

                                 hint: Text("Select specialization",style: txtStyle12AndOther,),
                                 onChanged: (String? newValue) {
                                   setState(() {
                                     selectedSpecializationValue = newValue!;
                                     print(selectedSpecializationValue);
                                   });
                                 },
                                 items: <String>[
                                   "Personal Training",
                                   "Nutrition Coaching",
                                   "Strength and Conditioning",
                                   "Yoga Instruction:",
                                   "Group Fitness Instruction",
                                   "Rehabilitation and Injury Prevention",
                                 ].map<DropdownMenuItem<String>>((String value) {
                                   return DropdownMenuItem<String>(
                                     value: value,
                                     child: Text(value,style: txtStyle14AndBlack,),
                                   );
                                 }).toList(),
                               ),
                             ),
                           ),
                         ),
                         sizeHeight20,
                         Text(
                           'Experience',
                           style: txtStyle14AndBold,
                         ),
                         sizeHeight15,
                         DropdownButtonHideUnderline(
                           child: SizedBox(
                             width: scrSize.width,
                             child: Container(
                               decoration: BoxDecoration(
                                 borderRadius: kBorderRadius10,
                                 border: Border.all(
                                     color: otherColor,
                                     width: 0.2
                                 ),
                               ),
                               padding: kPaddingHorizontal20,
                               child: DropdownButton<String>(
                                 value: selectedExperienceValue,
                                 iconEnabledColor: mainColor,

                                 hint: Text("Choose experience",style: txtStyle12AndOther,),
                                 onChanged: (String? newValue) {
                                   setState(() {
                                     selectedExperienceValue = newValue!;
                                     print(selectedExperienceValue);
                                   });
                                 },
                                 items: <String>[
                                   "one month",
                                   "three months",
                                   "six months",
                                   "one year",
                                   "two years",
                                   "more than two years",
                                 ].map<DropdownMenuItem<String>>((String value) {
                                   return DropdownMenuItem<String>(
                                     value: value,
                                     child: Text(value,style: txtStyle14AndBlack,),
                                   );
                                 }).toList(),
                               ),
                             ),
                           ),
                         ),
                         sizeHeight20,
                         Text(
                           'Time Slot',
                           style: txtStyle14AndBold,
                         ),
                         sizeHeight15,
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               // Container(
                               //   width: 100,
                               //   child: ,
                               // ),

                               Column(
                                 children: [
                                   GestureDetector(
                                     onTap: () {
                                       DatePicker.showTime12hPicker(
                                         context,
                                         showTitleActions: true,
                                         onChanged: (date) {
                                           print('change $date in time zone ' +
                                               date.timeZoneOffset.inHours
                                                   .toString());
                                         },
                                         onConfirm: (date) {
                                           // model.updateSelectedTimeFrom(date);
                                           provider.startTimeFun(dateTime: date);
                                           print('confirm $date');
                                         },
                                         currentTime: DateTime.now(),
                                       );
                                     },
                                     child: Container(
                                       // width: 80,
                                       padding: EdgeInsetsDirectional.only(
                                           top: 15, end: 25, start: 25, bottom: 15),
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(4),
                                           color: Colors.grey.shade100
                                           // AppColors.instance.backGroundColor
                                           ),
                                       child: Center(
                                           child: Text(
                                             provider.startTime != null?
                                                 DateFormat().add_Hm().format(provider.startTime!)
                                             // model.showTimeFrom
                                             //     ? AppUtils.showFormattedTime(
                                             //     model.selectedTimeFrom!)
                                                 :
                                           "Start Time",
                                             // model.selectedTime.hour.toString() +
                                             //     ":" +
                                             //     model.selectedTime.minute.toString(),
                                             ///
                                             // style: model.showErrorMessage
                                             //     ? TextStyleUtil.errorTextStyle(
                                             //     context)
                                             //     : TextStyleUtil
                                             //     .textStyleBeforeLoginRaqiBook(
                                             //     context),
                                           )),
                                     ),
                                   ),
                                   // if (model.showErrorMessage)
                                   //   Text("From time can\'t be empty",
                                   //       style: TextStyleUtil.errorTextStyle(context)),
                                 ],
                               ),
                               Column(
                                 children: [
                                   GestureDetector(
                                     onTap: () {
                                       DatePicker.showTime12hPicker(
                                         context,
                                         showTitleActions: true,
                                         onChanged: (date) {
                                           print('change $date in time zone ' +
                                               date.timeZoneOffset.inHours
                                                   .toString());
                                         },
                                         onConfirm: (date) {
                                           if(date.millisecondsSinceEpoch > provider.startTime!.millisecondsSinceEpoch){
                                           provider.endTimeFun(dateTime: date);
                                           print('confirm $date');
                                           }else{
                                             Utils.flushBarErrorMessage("End time is less than start time.", context);
                                           }
                                           // model.updateSelectedTimeTo(date);
                                         },
                                         currentTime: DateTime.now(),
                                       );
                                     },
                                     child: Container(
                                       // width: 80,
                                       padding: EdgeInsetsDirectional.only(
                                           top: 15, end: 25, start: 25, bottom: 15),
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(4),
                                           color: Colors.grey.shade100
                                         // AppColors.instance.backGroundColor
                                       ),
                                       child: Center(
                                           child: Text(
                                             provider.endTime != null
                                                 ? DateFormat().add_Hm().format(provider.endTime!)
                                                 :
                                           "End Time",
                                             // model.selectedTime.hour.toString() +
                                             //     ":" +
                                             //     model.selectedTime.minute.toString(),
                                             // style: model.showErrorMessage
                                             //     ? TextStyleUtil.errorTextStyle(
                                             //     context)
                                             //     : TextStyleUtil
                                             //     .textStyleBeforeLoginRaqiBook(
                                             //     context),
                                           )),
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                         sizeHeight20,
                         Align(
                           alignment: Alignment.topCenter,
                           child: Container(
                             width: scrSize.width*0.8,
                             child: button(
                               context: context,
                               onTap: () async {
                                 if(
                                 selectedSpecializationValue != null
                                     &&
                                 userImage != null
                                     &&
                                     selectedExperienceValue != null
                                     &&
                                     imagePicker.selectedFiles.isNotEmpty
                                     &&
                                     provider.startTime != null
                                     &&
                                     provider.endTime != null

                                 ){
                                   showMyWaitingModal(context: context);
                                   List<File> files = imagePicker.selectedFiles.map((platformFile) => File(platformFile.path!)).toList();
                                   List<String> certificateList = [];
                                   String userImageUrl = "";
                                   if(files.isNotEmpty){
                                     final FirebaseStorage _storage =
                                         FirebaseStorage.instance;

                                     try {
                                       if (userImage != null) {
                                         // Generate a unique file name for the image
                                         String fileName = DateTime.now()
                                             .millisecondsSinceEpoch
                                             .toString() +
                                             '.png';

                                         // Get the storage reference
                                         Reference reference = _storage
                                             .ref()
                                             .child('users_images')
                                             .child(FirebaseAuth
                                             .instance.currentUser!.uid)
                                             .child(fileName);

                                         // final imagePath = provider.getImageSignUp != null? provider.getImageSignUp! : NetworkImage(widget.googleAuthImageUrl!);
                                         // Upload the file to Firebase Storage
                                         TaskSnapshot taskSnapshot =
                                         await reference.putFile(userImage!);

                                         // Get the image URL from the uploaded image
                                         userImageUrl = await taskSnapshot.ref
                                             .getDownloadURL();
                                         for(int i=0; i<files.length; i++){
                                           String fileName = DateTime.now()
                                               .millisecondsSinceEpoch
                                               .toString() +
                                               '.png';

                                           // Get the storage reference
                                           Reference reference = _storage
                                               .ref()
                                               .child('users_images')
                                               .child(FirebaseAuth
                                               .instance.currentUser!.uid)
                                               .child(fileName);

                                           // final imagePath = provider.getImageSignUp != null? provider.getImageSignUp! : NetworkImage(widget.googleAuthImageUrl!);
                                           // Upload the file to Firebase Storage
                                           TaskSnapshot taskSnapshot =
                                           await reference.putFile(files[i]);

                                           // Get the image URL from the uploaded image
                                           await taskSnapshot.ref
                                               .getDownloadURL().then((value) {
                                                 setState(() {
                                                   certificateList.add(value);
                                                 });
                                           }).onError((error, stackTrace) {
                                             Utils.flushBarErrorMessage(error.toString(), context);
                                           print(error);
                                           });
                                         }
                                       }
                                       if(imagePicker.selectedFiles.length == certificateList.length){
                                         await provider.signupDataSendUpdateFun(map: {
                                           "certificateImageUrls" : certificateList,
                                           "userImage" : userImageUrl,
                                           "startTime" : provider.startTime,
                                           "endTime" : provider.endTime,
                                           "rating" : 0,
                                           "experience": selectedExperienceValue,
                                           "specialization" : selectedSpecializationValue,
                                         },context: context).then((value) {
                                           Utils.flushBarSuccessMessage("All Done", context);
                                         });
                                       }
                                     }  catch (e) {
                                       Utils.flushBarErrorMessage(e.toString(), context);
                                       print(
                                           'Error uploading image to Firebase: ${e.toString()}');
                                     }

                                  }
                                 }else{
                                   Utils.flushBarErrorMessage("Please select all fields.", context);
                                 }
                                 // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupStepThreeEmailVerify()));
                               },btnText: "Continue",),
                           ),
                         ),
                         sizeHeight20,
                       ],
                     ),
                   ),
                 ),
                  // sizeHeight0,
                ],
              ),
            ),
          );
        });
  }
}
