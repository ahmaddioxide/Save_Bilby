
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/features/authentications/controllers/signup_controller.dart';
import 'package:save_the_bilby_fund/features/authentications/models/user_model.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';


class ProfileFormWidget extends StatefulWidget {
  const ProfileFormWidget({Key? key}) : super(key: key);

  @override
  State<ProfileFormWidget> createState() => _ProfileFormWidgetState();
}

class _ProfileFormWidgetState extends State<ProfileFormWidget> {
  @override
  Widget build(BuildContext context) {

    final _formkey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("User Info", style: TextStyle(color: tPrimaryColor, fontSize: 20, ),),

            const SizedBox(height: tFormHeight - 10),

            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This field is required';
                }
                if (value.trim().length < 2) {
                  return 'Name must be valid';
                }
                // Return null if the entered username is valid
                return null;
              },

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_rounded),
                labelText: tFullName,
                hintText: tFullName,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),),

            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) {
                bool _isEmailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!);
                if (!_isEmailValid) {
                  return 'Invalid email.';
                }
                return null;
              },


              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: tEmail,
                hintText: tEmail,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),),


            const SizedBox(height: tFormHeight - 20),
            TextFormField(

              validator: (value) {
                bool _isEmailValid = RegExp(
                    r'^(?:[+0][1-9])?[0-9]{10,12}$')
                    .hasMatch(value!);
                if (!_isEmailValid) {
                  return 'Invalid phone number';
                }
                return null;
              },

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: tPhoneNo,
                hintText: tPhoneNo,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),),


            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'This field is required';
                }
                if (value.trim().length < 8) {
                  return 'Password must be at least 8 characters in length';
                }
                // Return null if the entered password is valid
                return null;
              },

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPassword,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),),

            const SizedBox(height: tFormHeight - 10),

            Text("Reward Points", style: TextStyle(color: tPrimaryColor, fontSize: 20, ),),

            const SizedBox(height: tFormHeight - 10),
            TextField(
              enableInteractiveSelection: false,
              focusNode: new AlwaysDisabledFocusNode(),

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.diamond_outlined),
                labelText: "Reward Points",
                hintText: "Reward Points",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),),
            const SizedBox(height: tFormHeight - 10),
            TextField(
              enableInteractiveSelection: false,
              focusNode: new AlwaysDisabledFocusNode(),

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.image),
                labelText: "Images Categorized",
                hintText: "Images Categorized",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),),



            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: tPrimaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),
                onPressed: () {
                  if(_formkey.currentState!.validate()){

                  }
                },
                child: Text("Update".toUpperCase()),

              ),
            )
          ],
        ),
      ),
    );
  }
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}