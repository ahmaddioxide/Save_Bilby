import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/features/authentications/controllers/session_controller.dart';
import 'package:save_the_bilby_fund/repository/authentication_repository/user_repository.dart';
import '../../../utils/Dashboard.dart';
import '../screens/login/login_screen.dart';

class SignUpController extends GetxController {


  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  DatabaseReference ref = FirebaseDatabase.instance.ref('Users');

  final userRepo = Get.put(UserRepository());

  void signUp(String username, String email, String password, String Phone)async{

    FirebaseAuth auth = FirebaseAuth.instance;
    final User = auth.currentUser;

    int Reward = 0;
    int imgCategorize = 0;

    try{
      auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value){

        SessionController().userid = value.user!.uid.toString();

        ref.child(value.user!.uid.toString()).set({
          'email': value.user!.email.toString(),
          'password': password,
          'UserName': username,
          'Phone' : Phone,
          'RewardPoints': Reward,
          'ImageCategorized': imgCategorize,
        });

        if(User != null){
          Get.offAll(() => const Dash());

        }
        // else{
        //   Get.to(() => const SignUpScreen());
        // }

      }).onError((error, stackTrace){
            Get.showSnackbar(GetSnackBar(message: error.toString(),));
      });
    } catch (error) {
      if(error != null) {
        Get.snackbar("Error", "Details are invalid",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red
        );
      }
      else if(error == null) {
        Get.snackbar("Registration Successful", "Welcome to DashBoard",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.greenAccent.withOpacity(0.1),
            colorText: Colors.teal,
        );
      }
    }
  }
  }
  