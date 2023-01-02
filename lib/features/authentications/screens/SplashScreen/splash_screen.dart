import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/login/login_screen.dart';
import 'package:save_the_bilby_fund/repository/authentication_repository/authentication_repository.dart';
import 'package:save_the_bilby_fund/constants/colors.dart';

import '../../../../firebase_options.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';


class Splash extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<Splash> {
  @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 5),
  //           ()=>Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder:
  //               (context) => LoginScreen()
  //           )
  //       )
  //   );
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
