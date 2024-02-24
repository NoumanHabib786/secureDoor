import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secure_fitness_comp/utils/notficationsBar.dart';

import '../Screens/AuthScreen/Signup/step_three_email_verified.dart';

class AuthenProvider extends ChangeNotifier {
  final email = TextEditingController();
  final password = TextEditingController();
  final userName = TextEditingController();
  var age = TextEditingController();
  final weight = TextEditingController();
  final height = TextEditingController();
  User? userData;

  // User? get userData => _userData;
  ///Sign up Functions
  ///User login fun
  Future loginEmailAndPassword({emailController, passwordController, context}) async {
    // showMyWaitingModal(context: context);
    // try {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } on FirebaseAuthMultiFactorException catch (e) {
      if (e.code == 'wrong-password') {
        // Check if the user has reached the maximum number of failed attempts
        Utils.flushBarErrorMessage("Wrong password! Please try again.",context); // Display toast message for wrong password
      }
      else if (e.code.contains('Access to this account has been temporarily disabled due to many failed login attempts') == true) {
        Utils.flushBarErrorMessage("Access has been temporarily disabled. Please reset your password.",context); // Display toast message to reset password
      }
      else if (e.code == 'too-many-requests') {
        Utils.flushBarErrorMessage("Access to this account has been temporarily disabled due to many failed login attempts. Please try again later or reset your password.",context); // Display toast message for account temporarily disabled
      }
      else if (e.code == 'user-not-found') {
        Utils.flushBarErrorMessage("You don't have account. Please create a account.",context); // Display toast message for account temporarily disabled
      }
      else {
        Utils.flushBarErrorMessage("Error -> ${e.code}",context);
        print('FirebaseAuthMultiFactorException Error: ${e.code}');
      }
    }

  }

  ///Forgot User

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print("Password reset email sent successfully");
    } catch (error) {
      print("Error sending password reset email: $error");
      // Handle the error as needed, e.g., show an error message to the user
    }
  }

  /// -> checkEmailVerified

  verificationCheckFun
      ({context,mounted}) {
    Timer? timerStore;
    Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload().then((value) {
        print("obRject");
        print(FirebaseAuth.instance.currentUser!.emailVerified);
        print(FirebaseAuth.instance.currentUser!.email);
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          timer.cancel();
          if (mounted) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => SignupStepThreeEmailVerified(),
                ),
                    (route) => false);
          }
        }
      });
      timerStore = timer;
      notifyListeners();
    });
    return timerStore;
  }

  /// -> Create User Fun
  User? userSignup;
  signupEmailAndPassword({emailController, passwordController, context,}) async {
    // showMyWaitingModal(context: context);
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController,
        password: passwordController,
      );
      userSignup = userCredential.user;
      if(userSignup != null){


      }else{
        print("Nothing");
      }
      // await sf.setString(DBkeys, "emailPassword");


      // });
      // }


    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'email-already-in-use') {
        Utils.flushBarErrorMessage("The email address is already in use. Please sign in or use a different email.",context);
        // Navigator.pop(context); // Display toast message for email already in use
        // showIndicator == true;
        notifyListeners();
        // print("lastValue aleady $showIndicator");
      }
      else {
        print('Error: ${e.code}');
        // showIndicator == true;
        notifyListeners();
      }
    } catch (e) {
      Navigator.pop(context);
      print('Error: $e');
      // showIndicator == true;
      notifyListeners();
    }
    // print("lastValue $showIndicator");
    notifyListeners();
  }
  Future<void> sendVerificationEmailLinkFun() async {
    // User? _user;
    print("Verification email sending started...");
    print("email ${FirebaseAuth.instance.currentUser?.email}");

    try {
      // Assuming _user is an instance of FirebaseAuth.instance.currentUser
      if (FirebaseAuth.instance.currentUser != null) {
        // Send the email verification link
        await FirebaseAuth.instance.currentUser?.sendEmailVerification();

        // This block will only be executed if the email is sent successfully
        print("Verification email sent successfully");
      } else {
        print("User is null. Please make sure the user is signed in.");
      }
    } catch (error) {
      // Handle any errors that occur during the process
      print("Error sending verification email: $error");
    } finally {
      // This block will be executed regardless of success or failure
      print("Verification email sending completed.");
      notifyListeners();
    }
    notifyListeners();
  }

  DateTime? storeSignupDateTime;
  storeSignupDateTimeFun({required DateTime dateTime}){
    storeSignupDateTime = dateTime;
    age = TextEditingController(text: DateFormat("MMM dd, yyyy").format(dateTime));
    notifyListeners();
  }
  /// Start & end Time
  DateTime? startTime;
  DateTime? endTime;
  startTimeFun({required DateTime dateTime}){
    startTime = dateTime;
    notifyListeners();
  }
  endTimeFun({required DateTime dateTime}){
    endTime = dateTime;
    notifyListeners();
  }
}