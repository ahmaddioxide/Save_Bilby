
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/features/authentications/models/user_model.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _db = FirebaseDatabase.instance;

  createUser(UserModel user)async{
    await _db.ref("Users").child(user.phoneNo).set(user.toJson()).whenComplete(
            () { Get.snackbar("Success", "Your account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green
            );}).catchError((error, stackTrace){
              debugPrint("ERRRRR : ${error}");
              Get.snackbar("Error", "${error}",
                snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.redAccent.withOpacity(0.1),
                  colorText: Colors.red
              );

    });
  }



}