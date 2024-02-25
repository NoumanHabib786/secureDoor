import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/Provider/auth_provider.dart';
import 'package:secure_fitness_comp/resources/components/Buttons.dart';
import 'package:secure_fitness_comp/resources/components/appbar.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
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
                            text2: "${value.enthusistModel?.name}"),
                        buildContainer(
                            text: "Email",
                            text2:
                                "${FirebaseAuth.instance.currentUser?.email}"),
                        buildContainer(
                            text: "Age",
                            text2: calculateAge(
                                value.enthusistModel?.age.toDate() ??
                                    DateTime.now())),
                        buildContainer(
                            text: "Body Type",
                            text2: "${value.enthusistModel?.bodyType}"),
                        buildContainer(
                            text: "Fitness Goal",
                            text2: "${value.enthusistModel?.fitnessGoal}"),
                        buildContainer(
                            text: "Height",
                            text2: "${value.enthusistModel?.height}"),
                        buildContainer(
                            text: "Weight",
                            text2: "${value.enthusistModel?.weight}"),
                        buildContainer(
                            text: "Pref. Activity",
                            text2:
                                "${value.enthusistModel?.preferredActivities}"),
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
