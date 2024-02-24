import 'package:flutter/material.dart';
import 'package:secure_fitness_comp/Screens/AuthScreen/login.dart';
import 'package:secure_fitness_comp/resources/imagesFolder.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';

import '../../resources/buttons.dart';
import '../../resources/color.dart';
import '../../resources/sizedbox.dart';
import '../../resources/textStyle.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    final scrSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.green,
          body:
          // Text('data')
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizeHeight70,
              Expanded(child: Image.asset(ImagesPaths.onBoardImage,fit: BoxFit.cover,width: double.maxFinite,height: double.maxFinite,)),
              // spacer,
              sizeHeight20,
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Let's Get Started",maxLines: 2,textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,style: TextStyle(
                    fontSize: 30
                  ),),
                ),
              ),
              sizeHeight15,
              Padding(
                padding: kPaddingHorizontal20,
                child: Text("To incentive active users and promote engagement, the app offers a rewards system. Engaging with friends, and inviting others to join.",
                  style: txtStyle14AndOther,),
              ),
              sizeHeight30,
              Padding(
                padding: kPaddingHorizontal20,
                child: button(
                  context: context,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                  bgColor: mainColor,
                  btnText: "Get Started",
                ),
              ),
              sizeHeight30
            ],
          ),
        ));
  }
}
