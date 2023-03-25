// import 'dart:js';

import 'package:araz_mobile_application/Constants/Colors.dart';
import 'package:araz_mobile_application/Screens/Announcement/AddAnnouncement.dart';
import 'package:araz_mobile_application/Screens/Announcement/AnnouncementListView.dart';
import 'package:araz_mobile_application/Screens/Announcement/AnnouncementView.dart';
import 'package:araz_mobile_application/Screens/Announcement/EditAnnouncement.dart';
import 'package:araz_mobile_application/Screens/Announcement/PreschoolListView.dart';
import 'package:araz_mobile_application/Screens/Marks/MarksListView.dart';
import 'package:araz_mobile_application/Screens/Marks/MarksViewPage.dart';
import 'package:araz_mobile_application/Screens/Marks/Marksaddpage.dart';
import 'package:araz_mobile_application/Screens/Marks/Markseditpage.dart';
import 'package:araz_mobile_application/Screens/Marks/NotificationPage.dart';

import 'package:araz_mobile_application/Screens/Announcement/Privacy_policy.dart';
import 'package:araz_mobile_application/Screens/Schools/AboutPage.dart';
import 'package:araz_mobile_application/Screens/Schools/SchoolAddPage.dart';
import 'package:araz_mobile_application/Screens/Schools/SchoolEditPage.dart';
import 'package:araz_mobile_application/Screens/Schools/SchoolListView.dart';
import 'package:araz_mobile_application/Screens/Schools/SchoolViewPage.dart';
import 'package:araz_mobile_application/Screens/auth/SignInpage.dart';
import 'package:araz_mobile_application/Screens/auth/SignupPage.dart';
import 'package:araz_mobile_application/Screens/Users/SplashScreen.dart';
import 'package:araz_mobile_application/Screens/Users/UserListView.dart';
import 'package:araz_mobile_application/Screens/Users/UserViewPage.dart';
import 'package:araz_mobile_application/Screens/Users/Usereditpage.dart';
import 'package:araz_mobile_application/Screens/Users/useraddpage.dart';
import 'package:araz_mobile_application/Widgets/Bottom_navigation_Bar.dart';
import 'package:araz_mobile_application/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {
  Color _primaryColor = primaryColor;
  Color _accentColor = accentColor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => SplashScreen(title: "title"),
        '/nav': (context) => Bottom_navigation_Bar(),

        //auth
        // 'auth/signIn': (context) => SignInPage(),
        'Admin/auth/Signup': (context) => SignUpPage(),
        // user
        'user/userListPage': (context) => UserListView(),
        'user/userViewPage': (context) => UserViewPage(),
        'user/Addpage': (context) => UseraddPage(),
        'user/editpage': (context) => Usereditpage(),
        //school
        'school/schoolListPage': (context) => SchoolListView(),
        'school/schoolViewPage': (context) => SchoolViewPage(),
        'school/Addpage': (context) => SchoolAddPage(),
        'school/editpage': (context) => SchoolEditPage(),
        // marks
        'mark/markListPage': (context) => MarksListView(),
        'mark/markViewPage': (context) => MarksViewPage(),
        'mark/Addpage': (context) => MarksaddPage(),
        'mark/editpage': (context) => Markseditpage(),
        // Admin
        'Admin/Notification': (context) => NotificationPage(),
        'Admin/About': (context) => AboutPage(),
        'Admin/Privacy policy': (context) => Privacy_policy(),
        //Anncounment
        '/Announcements/pre-schoolList': (context) => PreschoolListView(),
        '/Announcements/AnnouncementslistPage': (context) =>
            AnnouncementListView(),
        '/Announcements/AnnouncementsView': (context) => AnnouncementView(),
        '/Announcements/AddAnnouncements': (context) => AddAnnouncement(),
        '/Announcements/EditAnnouncements': (context) => EditAnnouncement(),
      },
    );
  }
}
