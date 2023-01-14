



import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/features/authentications/controllers/session_controller.dart';
import 'package:save_the_bilby_fund/repository/authentication_repository/authentication_repository.dart';
import 'package:save_the_bilby_fund/repository/authentication_repository/user_repository.dart';

import '../../../utils/utils.dart';

class ProfileController extends GetxController{

  static ProfileController get instance => Get.find();
  // final _authRepo = Get.put(AuthenticationRepository());
  // final _userRepo = Get.put(UserRepository());


  DatabaseReference ref = FirebaseDatabase.instance.ref("Users");

      void updateprofile(String name, String phone){
        
        ref.child(SessionController().userid.toString()).update({
          'UserName': name,
          'Phone': phone,
        }

        ).onError((error, stackTrace){
          Utils.toastMessageF(error.toString());

        });

        Utils.toastMessageS("Updated Successfully:)");


      }





  // getUserData(){
  //   // final email = _authRepo.firebaseUser.value?.email;
  //   if(email != null){
  //     return _userRepo.getUserDetails(email);
  //   }else{
  //     Get.snackbar("Error!", "Login to continue");
  //   }
  // }

}