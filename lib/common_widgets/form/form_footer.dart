import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/constants/sizes.dart';
import 'package:save_the_bilby_fund/constants/text_strings.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/contachForm/contact_form.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/login/login_screen.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/signup/signup_screen.dart';

import '../../constants/colors.dart';


class FooterWidget extends StatelessWidget {
  final String Texts, Title;
  const FooterWidget({
    Key? key, required this.Texts, required this.Title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: tFormHeight),
          TextButton(
            style: ButtonStyle(

                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.transparent)
                    )
                )

            ),
            onPressed: () {

              if(Title == tLogin){
                Get.to(() => const LoginScreen());
              }
              else{
                Get.to(() => const SignUpScreen());
              }




            },
            child: Text.rich(
              TextSpan(
                  text: Texts,
                  style: Theme.of(context).textTheme.headline6,
                  children: [
                    TextSpan(text: Title, style: TextStyle(color: footercolor))
                  ]),
            ),
          ),
          const SizedBox(height: 1),
          TextButton(
            style: ButtonStyle(

                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.transparent)
                    )
                )

            ),
            onPressed: () {

              Get.to(() => const ContactForm());

            },
            child: Text.rich(
              TextSpan(
                  text: "Have a Question? ",
                  style: Theme.of(context).textTheme.bodyText2,
                  children: [
                    TextSpan(text: "Contact Us", style: TextStyle(color: footercolor))
                  ]),
            ),
          ),

        ],
      ),
    );
  }
}