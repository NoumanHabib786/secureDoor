import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_fitness_comp/Provider/chatProvider.dart';
import 'package:secure_fitness_comp/Provider/postsProvider.dart';
import 'package:secure_fitness_comp/Screens/AuthScreen/Signup/professional_signup.dart';
import 'package:secure_fitness_comp/Screens/SplashScreen/splash_screen.dart';
import 'package:secure_fitness_comp/resources/appColors.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:secure_fitness_comp/utils/Routes/RoutesName.dart';
import 'package:secure_fitness_comp/utils/Routes/RoutesNavigate.dart';
import 'package:secure_fitness_comp/utils/pushNotify.dart';
import 'package:sizer/sizer.dart';

import 'dart:io';

import 'Provider/auth_provider.dart';
import 'Provider/image_picker_provider.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("firebox");
  await Firebase.initializeApp();

  await PushNotification().mSetupNotificationChannel();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    await PushNotification().mSetupLocalNotificationChannel();
    PushNotification().mSetupFirebaseNotificationService();
    PushNotification().mInitializeLocalNotification();
  }

  runApp(DevicePreview(
    enabled: false,
    tools: const [...DevicePreview.defaultTools],
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthenProvider>(
              create: (context) => AuthenProvider(),
            ),
            ChangeNotifierProvider<ImagePickerProvider>(
              create: (context) => ImagePickerProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => ChatProvider(),
            ),ChangeNotifierProvider(
              create: (context) => PostProvider(),
            ),
          ],
          child: MaterialApp(
            title: 'Fitness App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                centerTitle: true,
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.black87),
                titleTextStyle: ButtonFonts.btnW6(color: Colors.black),
              ),
              primarySwatch: MainColor.maincolor,
            ),
            initialRoute: RoutesName.splashScreen,
            onGenerateRoute: Routes.onGenerateRoute,
            // home: ProfessionalSignupScreen(),
          ),
        );
      },
    );
  }
}
