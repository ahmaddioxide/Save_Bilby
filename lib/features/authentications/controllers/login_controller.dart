



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/features/authentications/controllers/session_controller.dart';
import 'package:save_the_bilby_fund/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../utils/Dashboard.dart';
import '../screens/Category/navigation.dart';
import '../screens/login/login_screen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();


  /// TextField Controllers to get data from TextFields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  /// TextField Validation

  //Call this Function from Design & it will do the rest
  void loginUser(String email, String password) async {

    FirebaseAuth auth = FirebaseAuth.instance;
    // final User = auth.currentUser;

    // await auth.signInWithEmailAndPassword(email: email, password: password).then((value){
    //   SessionController().userid = value.user!.uid.toString();});
    // // if(await User != null){
    //   Get.offAll(() => const Dash());
    // // }

    try{
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value){
        SessionController().userid = value.user!.uid.toString();
          Get.offAll(() => const NavBar());
        Utils.toastMessageS("Logged in Successfully:)");

      }).onError((error, stackTrace){
        Utils.toastMessageF(error.toString());
      });
      

    }catch(error){

      Utils.toastMessageF(error.toString());

    }


  }
}