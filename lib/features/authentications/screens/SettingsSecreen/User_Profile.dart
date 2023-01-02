


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:save_the_bilby_fund/constants/sizes.dart';
import 'package:save_the_bilby_fund/constants/text_strings.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/SettingsSecreen/profile_form_widget.dart';
import '../custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context){

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: customAppBar("Profile", Icons.arrow_back),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: const [
                ProfileFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




