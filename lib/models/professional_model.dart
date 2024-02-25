import 'package:cloud_firestore/cloud_firestore.dart';

class ProfessionalUserModel {
  String userImage;
  String userId;
  List certificateImageUrls;
  Timestamp startTime;
  Timestamp endTime;
  String accountType;
  String name;
  String specialization;
  Timestamp age;
  int createdAt ;

  ProfessionalUserModel({
    required this.specialization,
    required this.userId,
    required this.userImage,
    required this.certificateImageUrls,
    required this.startTime,
    required this.accountType,
    required this.name,
    required this.endTime,
    required this.age,
    required this.createdAt,
  });

  factory ProfessionalUserModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalUserModel(
      specialization: json['specialization'],
      userId: json['userId'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      userImage: json['userImage'],
      accountType: json['accountType'],
      name: json['name'],
      age: json['age'],
      createdAt: json['createdAt'],
      certificateImageUrls: json['certificateImageUrls'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'certificateImageUrls': certificateImageUrls,
      'userId': userId,
      'createdAt': createdAt,
      'startTime': startTime,
      'endTime': endTime,
      'accountType': accountType,
      'name': name,
      'specialization': specialization,
      'age': age,
      'userImage': userImage,
    };
  }
}
