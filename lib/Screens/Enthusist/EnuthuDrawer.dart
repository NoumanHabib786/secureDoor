import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/Provider/auth_provider.dart';
import 'package:secure_fitness_comp/Screens/Enthusist/chat/mainChatScreen.dart';
import 'package:secure_fitness_comp/Screens/Enthusist/postsEnthu.dart';
import 'package:secure_fitness_comp/Screens/Enthusist/profileScreen.dart';
import 'package:secure_fitness_comp/resources/appColors.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:secure_fitness_comp/resources/height_width.dart';
import 'package:secure_fitness_comp/resources/imagesPaths.dart';
import 'package:secure_fitness_comp/utils/Routes/RoutesName.dart';
import 'package:sizer/sizer.dart';

class EnthuDrawer extends StatefulWidget {
  const EnthuDrawer({Key? key}) : super(key: key);

  @override
  State<EnthuDrawer> createState() => _EnthuDrawerState();
}

class _EnthuDrawerState extends State<EnthuDrawer> {
  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      color: AppColors.mainColor,
      padding: EdgeInsets.all(2.h),
      child: Column(
        children: [
          height(7),
          Image.asset(
            ImagesPaths.logoIcon,
            height: 15.h,
          ),
          height(2),
          Text(
            getGreeting(),
            style: MessageFonts.notifyW5(color: Colors.white),
          ),
          height(5),
          ListTile(
            onTap: () {
              RoutesName.push2(context, MainChatScreen());
            },
            title: Text(
              "Chats",
              style: MessageFonts.notifyW5(color: Colors.white),
            ),
            trailing: Icon(
              CupertinoIcons.right_chevron,
              size: 2.h,
              color: Colors.white,
            ),
          ),
          ListTile(
            onTap: () {
              RoutesName.push2(context, PostEnthuScreen());
            },
            title: Text(
              "Posts",
              style: MessageFonts.notifyW5(color: Colors.white),
            ),
            trailing: Icon(
              CupertinoIcons.right_chevron,
              size: 2.h,
              color: Colors.white,
            ),
          ),
          ListTile(
            onTap: () {
              RoutesName.push2(context, EnthuProfile());
            },
            title: Text(
              "Profile",
              style: MessageFonts.notifyW5(color: Colors.white),
            ),
            trailing: Icon(
              CupertinoIcons.right_chevron,
              size: 2.h,
              color: Colors.white,
            ),
          ),
          Spacer(),
          ListTile(
            onTap: () async {
              var pro = Provider.of<AuthenProvider>(context, listen: false);
              await FirebaseAuth.instance.signOut();
              setState(() {
                pro.professionalUserModel = null;
                pro.enthusistModel = null;
              });
              RoutesName.remove(context, RoutesName.splashScreen);
            },
            title: Text(
              "Logout",
              style: MessageFonts.notifyW5(color: Colors.white),
            ),
            trailing: Icon(
              Icons.logout,
              size: 2.h,
              color: Colors.white,
            ),
          ),
          height(3)
        ],
      ),
    );
  }
}
