import 'package:cloud_firestore/cloud_firestore.dart';

class EnthusistModel {
  String fitnessGoal;
  String userId;
  String bodyType;
  String workoutDifficulty;
  String preferredActivities;
  String accountType;
  String name;
  String weight;
  Timestamp age;
  String height;

  EnthusistModel({
    required this.fitnessGoal,
    required this.userId,
    required this.bodyType,
    required this.workoutDifficulty,
    required this.preferredActivities,
    required this.accountType,
    required this.name,
    required this.weight,
    required this.age,
    required this.height,
  });

  factory EnthusistModel.fromJson(Map<String, dynamic> json) {
    return EnthusistModel(
      fitnessGoal: json['fitnessGoal'],
      userId: json['userId'],
      bodyType: json['bodyType'],
      workoutDifficulty: json['workoutDifficulty'],
      preferredActivities: json['preferredActivities'],
      accountType: json['accountType'],
      name: json['name'],
      weight: json['weight'],
      age: json['age'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fitnessGoal': fitnessGoal,
      'userId': userId,
      'bodyType': bodyType,
      'workoutDifficulty': workoutDifficulty,
      'preferredActivities': preferredActivities,
      'accountType': accountType,
      'name': name,
      'weight': weight,
      'age': age,
      'height': height,
    };
  }
}
