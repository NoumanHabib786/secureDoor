import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutesName {


  // Main Screens Name
  static const String splashScreen = 'splashScreen';
  static const String homeScreen = 'homeScreen';


  // Admin Side Screen
  static const String adminDrawer = "adminDrawer";
  static const String CategoryScreen = "CategoryScreen";
  static const String SpecialityScreen = "SpecialityScreen";
  static const String PatientsList = "PatientsList";





  // User Side Screens
  static const String disabilityScreen = "DisabilityScreen";
  static const String ElderlyCareScreen = "ElderlyCareScreen";
  static const String TherapistsVideosScreen = "TherapistsVideosScreen";
  static const String ModifyScreen = "ModifyScreen";
  static const String DoctorProfileView = "DoctorProfileView";
  static const String SuggustedTherapistsScreen = "SuggustedTherapistsScreen";
  static const String TimeSelectionScreen = "TimeSelectionScreen";
  static const String AppointmentDetails = "AppointmentDetails";
  static const String PaymentScreen = "PaymentScreen";
  static const String SubscriptionScreen = "SubscriptionScreen";
  static const String PayCardScreen = "PayCardScreen";
  static const String MainTabsAppointmentsScreen = "MainTabsAppointmentsScreen";
  static const String MainChatScreen = "MainChatScreen";
  static const String ChatScreen = "ChatScreen";
  static const String ReviewsDoctorSc = "ReviewsDoctorSc";
  static const String OnBordingScreen = "OnBordingScreen";
  static const String LoginScreen = "LoginScreen";
  static const String SignUpScreen = "SignUpScreen";
  static const String TherapistBottomScreens = "TherapistBottomScreens";
  static const String PatientHomeScreen = "PatientHomeScreen";
  static const String NotificationScreen = "NotificationScreen";
  static const String AdminBottomBarScreen = "AdminBottomBarScreen";
  static const String BottomBarScreen = "BottomBarScreen";
  static const String PatientAppointmentDetails = "PatientAppointmentDetails";
  static const String RequestFormScreen = "RequestFormScreen";




  // Case Manager || Doctor
  static const String DocDetailsSignUp = "DocDetailsSignUp";
  static const String DocDetails1SignUp = "DocDetails1SignUp";
  static const String MainTabSolutionsScreen = "MainTabSolutionsScreen";

  // PUSH METHOD

  static push(BuildContext context, String route) {
    return Navigator.pushNamed(context, route);
  }
static push2(BuildContext context, Widget route) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) =>  route,));
  }

  // REPLACE METHOD

  static replace(BuildContext context, String route) {
    return Navigator.pushReplacementNamed(context, route);
  }

  // REMOVE METHOD

  static remove(BuildContext context, String route) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      route,
          (route) => false,
    );
  }

}
