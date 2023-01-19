import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
      bottomNavigationBar: GNav(
        backgroundColor: tPrimaryColor,
        rippleColor: Color(0xD6EFE8FF),
        hoverColor: Color(0x046054FF),
        gap: 10,
        activeColor: tPrimaryColor,
        iconSize: 24,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: Colors.white,
        color: Colors.white,
        // animationDuration: Duration(milliseconds: 1000),
        // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        // // surfaceTintColor: Colors.white,
        // elevation: 30,
        // backgroundColor: tPrimaryColor,
        // selectedIndex: currentindex,
        selectedIndex: currentindex,
        onTabChange: (index) => setState(() => currentindex = index),
        tabs: [
          GButton(
            icon: Icons.app_registration_rounded,
            text: "Survey",
          ),
          GButton(
            icon: Icons.person,
            text: "Profile",
          ),
          GButton(
            icon: Icons.message,
            text: "Contact Us",
          ),
        ],
      ),
      body: screens[currentindex],
    );
  }
}
