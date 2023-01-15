

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/common_widgets/form/form_footer.dart';
import 'package:save_the_bilby_fund/constants/sizes.dart';
import 'package:save_the_bilby_fund/constants/text_strings.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/login/login_form_widget.dart';

import '../../../../constants/colors.dart';
import '../custom_appbar.dart';

class LoginScreen extends StatelessWidget  {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: tPrimaryColor,
          centerTitle: true,
          automaticallyImplyLeading: false,

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),

          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(110.0),
              child: Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Image(image: AssetImage("assets/images/whitebilby.png"), height: 100),
                      ],
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                // (,
                LoginForm(),
                FooterWidget(Texts: tDontHaveAnAccount,Title: tSignup),
              ],
            ),
          ),
        ),
      ),
    );
  }
}