import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Screens/Home.dart';
import '../Screens/Profile_Page.dart';

class Bottom_navigation_Bar extends StatefulWidget {
  static const String routeName = '/home';
  const Bottom_navigation_Bar({super.key});

  @override
  State<Bottom_navigation_Bar> createState() => _Bottom_navigation_BarState();
}

class _Bottom_navigation_BarState extends State<Bottom_navigation_Bar> {
  static const String routeName = "/Bnav";
  int _currentIndex = 0;

  final List<Widget> _children = [
    Home(),
    ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black26,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: accentColor,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            tooltip: "Home",
            icon: Icon(
              Icons.home,
              color: tdwhite,
            ),
            // title: new Text('Home'),
            label: 'Home',
            // backgroundColor: Colors.black38
          ),
          BottomNavigationBarItem(
              tooltip: "Profile",
              icon: Icon(
                Icons.person,
                color: tdwhite,
              ),
              // title: Text('Profile'),
              label: 'Profile'),
        ],
      ),
    );
  }
}
