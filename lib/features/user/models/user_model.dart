import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? Uid;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  final bool activeStatus = false;
  final int imageCategorized = 0;
  final int rewardPoints = 0;

  const UserModel({
    this.Uid,
    required this.email,
    required this.fullName,
    required this.phoneNo,
    required this.password,
  });

  toJson() {
    return {
      "UID": Uid,
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
      "rewardPoints": rewardPoints,
      "imageCategorized": imageCategorized,
      "activeStatus": activeStatus,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        Uid: document.id,
        email: data["Email"],
        fullName: data["FullName"],
        phoneNo: data["Phone"],
        password: data["Password"]);
  }
}
