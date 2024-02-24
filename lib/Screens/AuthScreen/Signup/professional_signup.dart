
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';

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
                           'Time Slot',
                           style: txtStyle14AndBold,
                         ),
                         sizeHeight15,
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             // Container(
                             //   width: 100,
                             //   child: ,
                             // ),
                             Text(
                               'Time: ',
                               // style: TextStyleUtil.textStyleBeforeLoginRaqiBook(
                               //     context),
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
                                         // model.updateSelectedTimeFrom(date);
                                         print('confirm $date');
                                       },
                                       currentTime: DateTime.now(),
                                     );
                                   },
                                   child: Container(
                                     // width: 80,
                                     padding: EdgeInsetsDirectional.only(
                                         top: 6, end: 20, start: 20, bottom: 6),
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(4),
                                         color: Colors.grey
                                         // AppColors.instance.backGroundColor
                                         ),
                                     child: Center(
                                         child: Text(
                                           provider.endTime != null?
                                               DateFormat().add_Hm().format(provider.endTime!)
                                           // model.showTimeFrom
                                           //     ? AppUtils.showFormattedTime(
                                           //     model.selectedTimeFrom!)
                                               :
                                         "From",
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
                                         provider.startTimeFun(dateTime: date);
                                         // model.updateSelectedTimeTo(date);
                                         print('confirm $date');
                                       },
                                       currentTime: DateTime.now(),
                                     );
                                   },
                                   child: Container(
                                     // width: 80,
                                     padding: EdgeInsetsDirectional.only(
                                         top: 6, end: 20, start: 20, bottom: 6),
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(4),
                                         color: Colors.grey,
                                         // AppColors.instance.backGroundColor
                                     ),
                                     child: Center(
                                         child: Text(
                                           provider.startTime != null
                                               ? DateFormat().add_Hm().format(provider.startTime!)
                                               :
                                         "To",
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
                         Align(
                           alignment: Alignment.topCenter,
                           child: Container(
                             width: scrSize.width*0.8,
                             child: button(
                               context: context,
                               onTap: (){
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
