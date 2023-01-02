
import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../custom_appbar.dart';
import 'contact_form_widget.dart';

class ContactForm extends StatelessWidget  {
  const ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: customAppBar("Contact Form", Icons.arrow_back),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [

                ContactFormWidget(),
                // FooterWidget(Texts: tDontHaveAnAccount,Title: tSignup),
              ],
            ),
          ),
        ),
      ),
    );
  }
}