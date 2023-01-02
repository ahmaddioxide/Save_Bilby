
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/features/authentications/controllers/signup_controller.dart';
import 'package:save_the_bilby_fund/features/authentications/models/user_model.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';


class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formkey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
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
              controller: controller.email,
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

              controller: controller.phoneNo,

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
              controller: controller.password,
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

                    // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());

                    final user = UserModel(email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                        fullname: controller.fullName.text.trim(),
                        phoneNo: controller.phoneNo.text.trim());
                    SignUpController.instance.createUser(user);


                  }
                },
                child: Text(tSignup.toUpperCase()),

              ),
            )
          ],
        ),
      ),
    );
  }
}