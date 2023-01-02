



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();


  /// TextField Controllers to get data from TextFields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();




  /// TextField Validation

  //Call this Function from Design & it will do the rest
  Future<void> loginUser(String email, String password) async {


    String? error = await AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
    if(error != null) {
      Get.snackbar("Error", "Details are invalid",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red
      );
    }


  }
}