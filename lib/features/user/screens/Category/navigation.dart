

import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../SettingsSecreen/User_Profile.dart';
import '../contachForm/contact_form.dart';
import 'category_screen.dart';



class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int currentindex = 0;
  final screens = [
    CategoriesScreen(),
    ProfileScreen(),
    ContactForm(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        backgroundColor: tPrimaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        currentIndex: currentindex,
        onTap: (index) => setState(() => currentindex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration_rounded),
            label: "Survey",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Contact Us",
          ),

        ],
      ),
      body: screens[currentindex],

    );
  }


}
