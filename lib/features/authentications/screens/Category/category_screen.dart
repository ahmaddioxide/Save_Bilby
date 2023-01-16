
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/custom_appbar.dart';
import 'package:save_the_bilby_fund/constants/colors.dart';
import 'package:save_the_bilby_fund/features/authentications/screens/Category/cards_grid_widget.dart';
import 'package:firebase_database/firebase_database.dart';

import '../SettingsSecreen/User_Profile.dart';
import '../contachForm/contact_form.dart';
import 'data.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final controller = ScrollController();
  Future WaitFunctionToLoadImageURLInCards() async {
    await Future.delayed(Duration(seconds: 3));

//return your_main_future_code_here;
  }

  final _pageOptions = [
    CategoriesScreen(),
    ContactForm(),
    ProfileScreen(),
  ];

  final DatabaseReference imageref =
      FirebaseDatabase.instance.ref().child('images');

  void Remove() async {
    List<String> imagekeys = [];
    final Mainimageref = FirebaseDatabase.instance.ref("images");
    DatabaseEvent event = await Mainimageref.once();
    Map<String, dynamic> children =
        Map<String, dynamic>.from(event.snapshot.value as Map);

    children.entries.forEach((e) => imagekeys.add(e.key.toString()));
    for (int i = 0; i < 4; i++) {
      final DatabaseReference ref =
          FirebaseDatabase.instance.ref().child('images/${imagekeys[i]}');
      ref.remove();
    }
  }

  int count = 0;
  bool visible = true;

  List<Data> datalist = [];
  String ImageURL = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: tPrimaryColor,
        foregroundColor: Colors.white,
        onPressed: scrollUp,
        child: Icon(Icons.arrow_upward),
      ),
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
            preferredSize: const Size.fromHeight(80.0),
            child: Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage("assets/images/whitebilby.png"),
                          height: 70),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 25,
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
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Wrap(
            runSpacing: 5,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "To categorize next image click on :",
                    style: TextStyle(
                      color: tPrimaryColor,
                      fontSize: 17,
                    ),
                  ),
                  Visibility(
                    visible: visible,
                    child: TextButton(


                        onPressed: () {
                          setState(() {
                            count++;
                          });
                          if (count == 4) {
                            Remove();
                            count = 0;
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 300,
                                    child: AlertDialog(
                                      backgroundColor: Color(0xff455A64),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      content: Container(
                                        height: 300,
                                        color: Color(0xff455A64),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Dear user you had reached your maximum limit of categorizing four images!",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                "Do you want to continue categorize more images or quit!",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              )
                                            ]),
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(AlertDialog);
                                              },
                                              child: Text(
                                                "Continue ",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  SystemNavigator.pop();
                                                },
                                                child: Text(
                                                  "Quit",
                                                  style: TextStyle(fontSize: 20),
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                });
                          }
                          //Remove();
                        },
                        child: Text('Next',
                            style: TextStyle(
                                fontSize: 20,
                                color: tPrimaryColor,
                                fontWeight: FontWeight.bold))),
                  )
                ],
              ),
              Container(
                height: 230,
                child: StreamBuilder(
                  stream: imageref.onValue,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Container(
                          height: MediaQuery.of(context).size.height / 1.25,
                          width: MediaQuery.of(context).size.width / 1.25,
                          child: Center(child: CircularProgressIndicator()));
                    } else if (snapshot.hasData) {
                      datalist.clear();
                      if(snapshot.data.snapshot.value == null){
                        // visible = false;
                        return Center(
                          child: Text("No image to show"),
                        );
                      }else{
                        var keys = snapshot.data.snapshot.value.keys;
                        var values = snapshot.data.snapshot.value;
                        for (var key in keys) {
                          Data data = new Data(values[key]["imageURL"]);
                          datalist.add(data);
                        }
                        ImageURL = datalist[count].imgurl;
                        // Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                        return Center(
                          child: Image.network(
                            datalist[count].imgurl,
                            fit: BoxFit.cover,
                          ),
                        );

                      }


                    } else
                      return SizedBox(
                          child: Image.asset(
                        'assets/images/bilby.jpg',
                      ));
                  },
                ),
              ),
              Text(
                "Category : ",
                style: TextStyle(
                    color: tPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Please select a category for the image",
                style: TextStyle(
                  color: tPrimaryColor,
                  fontSize: 17,
                ),
              ),
              FutureBuilder(
                future: WaitFunctionToLoadImageURLInCards(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CategoryList(
                      image_url_: ImageURL,
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void scrollUp() {
    final double start = 0;
    controller.jumpTo(start);
  }
}
