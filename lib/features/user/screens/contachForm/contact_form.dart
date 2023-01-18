
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_the_bilby_fund/features/user/controllers/session_controller.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import 'contact_form_widget.dart';

class ContactForm extends StatelessWidget  {
  const ContactForm({Key? key}) : super(key: key);

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
                        SizedBox(width: 15,),
                        Center(
                          child: SizedBox.fromSize(
                            size: Size(56, 56),
                            child: ClipOval(
                              child: Material(
                                color: tPrimaryColor,
                                child: InkWell(
                                  splashColor: Colors.white,
                                  onTap: () {  Get.back();
                                  },
                                  child: Visibility(

                                    visible: usercheck(),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[


                                        Icon(Icons.arrow_back, color: Colors.white, size: 30,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 50,),

                        Image(image: AssetImage("assets/images/whitebilby.png"), height: 100),
                      ],
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
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
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [

                ContactFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool usercheck(){
    if(SessionController().userid.toString() == ""){
      return true;

    }
    else{
      return false;
    }
  }
}