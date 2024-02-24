import 'package:secure_fitness_comp/utils/notficationsBar.dart';
import 'package:flutter/cupertino.dart';

enum Errors { Detail, Gender, Others, awards, RequestService, Email }

class ErrorsClass {
  String message = '';

  static getErrorMessage(Errors? errorType, BuildContext context) {
    String? message;
    switch (errorType) {
      case Errors.Detail:
        message = "The detail field is required.";
        break;
      case Errors.Gender:
        message = 'The selected gender is invalid.';
        break;
      case Errors.awards:
        message = 'The awards field is required.';
        break;
      case Errors.RequestService:
        message = 'The name has already been taken.';
        break;
      case Errors.Email:
        message = 'The email has already been taken.';
        break;

      case Errors.Others:
        message = "Invalid other";
        break;
      default:
        message = 'Some validations';
        break;
    }

    Utils.flushBarErrorMessage(message, context);
  }
}
