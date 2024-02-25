import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/Provider/auth_provider.dart';
import 'package:secure_fitness_comp/resources/components/Buttons.dart';
import 'package:secure_fitness_comp/resources/components/appbar.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:secure_fitness_comp/resources/imagesFolder.dart';
import 'package:secure_fitness_comp/resources/sizedbox.dart';
import 'package:sizer/sizer.dart';

class EnthuProfile extends StatefulWidget {
  const EnthuProfile({Key? key}) : super(key: key);

  @override
  State<EnthuProfile> createState() => _EnthuProfileState();
}

class _EnthuProfileState extends State<EnthuProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  fetch() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AuthenProvider>().userDataFunction(context);
    });
  }

  String calculateAge(DateTime birthDate) {
    // Current date
    DateTime currentDate = DateTime.now();

    // Calculate age
    int age = currentDate.year - birthDate.year;

    // Check if the birthday has occurred this year
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(context: context, title: "Profile", isAuto: true),
      body: Consumer<AuthenProvider>(
        builder: (context, value, child) {
          return value.userLoading
              ? Center(
                  child: loading(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Column(
                      children: [
                        buildContainer(
                            text: "Name",
                            text2: "${value.enthusistModel?.name ?? value.professionalUserModel?.name}"),
                        buildContainer(
                            text: "Email",
                            text2:
                                "${FirebaseAuth.instance.currentUser?.email}"),
                        buildContainer(
                            text: "Age",
                            text2: calculateAge(
                                value.enthusistModel?.age.toDate() ?? value.professionalUserModel!.age.toDate())),
                        value.professionalUserModel != null?
                           buildContainer(
                             text: "Specialization",
                             text2: value.professionalUserModel?.specialization ??""
                           )
                            :
                        buildContainer(
                            text: "Body Type",
                            text2: "${value.enthusistModel?.bodyType}"),
                        value.professionalUserModel != null?
                        SizedBox()
                            :
                        buildContainer(
                            text: "Fitness Goal",
                            text2: "${value.enthusistModel?.fitnessGoal}"),
                        value.professionalUserModel != null?
                        SizedBox()
                            :
                        buildContainer(
                            text: "Height",
                            text2: "${value.enthusistModel?.height}"),
                        value.professionalUserModel != null?
                        SizedBox()
                            :
                        buildContainer(
                            text: "Weight",
                            text2: "${value.enthusistModel?.weight}"),
                        value.professionalUserModel != null?
                        SizedBox()
                            :
                        buildContainer(
                            text: "Pref. Activity",
                            text2:
                                "${value.enthusistModel?.preferredActivities}"),
                        value.professionalUserModel != null?
                        Container(
                          // padding: EdgeInsets.all(1.5.h),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                                child: Text(
                                  "Image",
                                  style: MessageFonts.notifyW5(),
                                ),
                              ),
                              // sizeHeight15,
                              SizedBox(
                                  width: double.maxFinite,
                                  height: 250,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                                      child: ImagesFolder.getImage(
                                        url:
                                        value.professionalUserModel?.userImage ?? ""))),
                            ],
                          ),
                        )
                        :
                        SizedBox(),
                        value.professionalUserModel != null?
                        Container(
                          // padding: EdgeInsets.all(1.5.h),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
                                child: Text(
                                  "Certificates",
                                  style: MessageFonts.notifyW5(),
                                ),
                              ),
                              // sizeHeight15,
                              SizedBox(
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                      itemCount: value.professionalUserModel?.certificateImageUrls.length,
                                      itemBuilder: (context,index){
                                    return  value.professionalUserModel?.certificateImageUrls[index].toString().contains("png") == true? ClipRRect(
                                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                                        child:  SizedBox(
                                          height: 250,
                                          // fit: BoxFit.cover,
                                          child: ImagesFolder.getImage(
                                            url:
                                            value.professionalUserModel?.certificateImageUrls[index],
                                            ),
                                        )) : Text("${value.professionalUserModel?.certificateImageUrls.length} Documents are available");
                                  })),
                            ],
                          ),
                        )
                        :
                        SizedBox(),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  Container buildContainer({required String text, text2}) {
    return Container(
      padding: EdgeInsets.all(1.5.h),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Text(
            "$text",
            style: MessageFonts.notifyW5(),
          ),
          Expanded(
              child: Text(
            "$text2",
            textAlign: TextAlign.right,
            style: MessageFonts.notifySimple(),
          )),
        ],
      ),
    );
  }
}
