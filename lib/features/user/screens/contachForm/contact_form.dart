import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/features/user/controllers/session_controller.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import 'contact_form_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({Key? key}) : super(key: key);
  final urlprivacy = 'https://www.savethebilbyfund.org.au/privacy-policy/';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Center(
                          child: SizedBox.fromSize(
                            size: Size(56, 56),
                            child: ClipOval(
                              child: Material(
                                color: tPrimaryColor,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Visibility(
                                    visible: usercheck(),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Image(
                            image: AssetImage("assets/images/whitebilby.png"),
                            height: 100),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact Form",
                            style: TextStyle(
                                fontSize: 26,
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContactFormWidget(),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("© Save The Bilby Fund 2023. All rights reserved.",
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      TextButton(
                          onPressed: () async {
                            await launchUrl(Uri.parse(urlprivacy));
                          },
                          child: Text(
                            "Privacy Policy",
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 12,fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool usercheck() {
    if (SessionController().userid.toString() == "") {
      return true;
    } else {
      return false;
    }
  }
}
