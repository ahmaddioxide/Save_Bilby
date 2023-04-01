import 'package:flutter/material.dart';
import 'package:save_the_bilby_fund/features/user/screens/Profile/User_Profile.dart';
import 'package:save_the_bilby_fund/features/user/screens/contactUs/contact_form.dart';
import '../../../constants/colors.dart';
import 'Category/category_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 1;
  final screens = [
    ProfileScreen(),
    CategoriesScreen(),
    ContactForm(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          backgroundColor: Colors.blueGrey,
          color: tPrimaryColor,
          animationDuration: Duration(milliseconds: 300),
          height: 55,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            Icon(
              Icons.person,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.app_registration_rounded,
              size: 24,
              color: Colors.white,
            ),
            Icon(
              Icons.message,
              size: 24,
              color: Colors.white,
            )
          ]),
      body: screens[currentIndex],
    );
  }
}
