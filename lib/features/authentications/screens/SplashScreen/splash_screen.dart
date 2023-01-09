import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/features/authentications/controllers/session_controller.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/login/login_screen.dart';
import 'package:save_the_bilby_fund/repository/authentication_repository/authentication_repository.dart';
import 'package:save_the_bilby_fund/constants/colors.dart';

import '../../../../firebase_options.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../../utils/Dashboard.dart';


class Splash extends StatefulWidget {


  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<Splash> {
  // FirebaseAuth auth = FirebaseAuth.instance;




  // @override
  // void initState() {
  //   super.initState();
  //   final user = auth.currentUser;
  //   if(user != null){
  //     SessionController().userid = user.uid.toString();
  //     Timer(Duration(seconds: 5), ()=> Get.offAll(() => const Dash()));
  //
  //   }else{
  //     Timer(Duration(seconds: 5), ()=> Get.offAll(() => const LoginScreen()));
  //
  //   }


  // }

  @override
  Widget build(BuildContext context) {

    return Container(
        color: tPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/whitebilby.png"), height: 160),

            SizedBox(height: 70,),

            Text(
              "Save the Bilby Funds",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),          ],
        ),



    );


  }


}
