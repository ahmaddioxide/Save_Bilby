import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/features/user/controllers/session_controller.dart';
import 'package:save_the_bilby_fund/features/user/screens/login/login_screen.dart';
import 'package:save_the_bilby_fund/constants/colors.dart';
import '../Category/navigation.dart';

// In Splash screen we initialized firebase authentication and check if user already loggedin then it will take him to Home screen
class Splash extends StatefulWidget {


  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<Splash> {
  FirebaseAuth auth = FirebaseAuth.instance;




  @override
  void initState() {
    super.initState();
    final user = auth.currentUser;
    // Firebase.initializeApp().then((value) => Get.put(AuthenticationRepository()));
    if(user != null){
      SessionController().userid = user.uid.toString();
      Timer(Duration(seconds: 3), ()=> Get.offAll(() =>  NavBar()));

    }else{
      // print("hello");
      Timer(Duration(seconds: 3), ()=> Get.offAll(() =>  LoginScreen()));

    }

  }

  @override
  Widget build(BuildContext context) {

    return Container(
        color: tPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/whitebilby.png"), height: 160),

            SizedBox(height: 50,),

            // Text(
            //   "Save the Bilby Funds",
            //   style: TextStyle(
            //       fontSize: 23,
            //       fontWeight: FontWeight.w400,
            //       color: Colors.white),
            // ),
          ],
        ),



    );


  }


}
