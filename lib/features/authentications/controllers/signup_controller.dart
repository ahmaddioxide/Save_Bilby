import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/features/authentications/controllers/session_controller.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/signup/signup_screen.dart';
import 'package:save_the_bilby_fund/repository/authentication_repository/user_repository.dart';
import '../../../utils/Dashboard.dart';
import '../../../utils/utils.dart';
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
    // final User = auth.currentUser;

    int Reward = 0;
    int imgCategorize = 0;
    UserCredential? userCredential;

    try{
       userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value){

        SessionController().userid = value.user!.uid.toString();

        ref.child(value.user!.uid.toString()).set({
          'email': value.user!.email.toString(),
          // 'password': password,
          'UserName': username,
          'Phone' : Phone,
          'RewardPoints': Reward,
          'ImageCategorized': imgCategorize,
        });

        // if(userCredential!.user!.emailVerified == false){
        //   User? x =  FirebaseAuth.instance.currentUser;
        //   x?.sendEmailVerification();
        // }

          Get.offAll(() => const LoginScreen());
        Utils.toastMessageS("Registered Successfully:)");



      }).onError((error, stackTrace){
        Utils.toastMessageF(error.toString());
      });
    } catch (error) {
      Utils.toastMessageF(error.toString());

    }
  }
  }
  