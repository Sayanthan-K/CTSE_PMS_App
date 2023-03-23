// import 'dart:js';

import 'package:araz_mobile_application/Constants/Colors.dart';
import 'package:araz_mobile_application/Screens/AboutPage.dart';
import 'package:araz_mobile_application/Screens/Announcement/AddAnnouncement.dart';
import 'package:araz_mobile_application/Screens/Announcement/AnnouncementListView.dart';
import 'package:araz_mobile_application/Screens/Announcement/AnnouncementView.dart';
import 'package:araz_mobile_application/Screens/Announcement/EditAnnouncement.dart';
import 'package:araz_mobile_application/Screens/Announcement/PreschoolListView.dart';
import 'package:araz_mobile_application/Screens/MarksAddPage.dart';
import 'package:araz_mobile_application/Screens/MarksEditPage.dart';
import 'package:araz_mobile_application/Screens/MarksListView.dart';
import 'package:araz_mobile_application/Screens/MarksViewPage.dart';
import 'package:araz_mobile_application/Screens/NotificationPage.dart';
import 'package:araz_mobile_application/Screens/Privacy_policy.dart';
import 'package:araz_mobile_application/Screens/SchoolAddPage.dart';
import 'package:araz_mobile_application/Screens/SchoolEditPage.dart';
import 'package:araz_mobile_application/Screens/SchoolListView.dart';
import 'package:araz_mobile_application/Screens/SchoolViewPage.dart';
import 'package:araz_mobile_application/Screens/SignupPage.dart';
import 'package:araz_mobile_application/Screens/SplashScreen.dart';
import 'package:araz_mobile_application/Screens/UserListView.dart';
import 'package:araz_mobile_application/Screens/UserViewPage.dart';
import 'package:araz_mobile_application/Screens/Usereditpage.dart';
import 'package:araz_mobile_application/Screens/useraddpage.dart';
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
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext _) => SplashScreen(title: "title");
            break;
          case '/nav':
            builder = (BuildContext _) => Bottom_navigation_Bar();
            break;
          case 'user/userListPage':
            builder = (BuildContext _) => new UserListView();
            break;
          case 'user/userViewPage':
            builder = (BuildContext _) => new UserViewPage();
            break;
          case 'user/Addpage':
            builder = (BuildContext _) => new UseraddPage();
            break;
          case 'user/editpage':
            builder = (BuildContext _) => new Usereditpage();
            break;
          case 'mark/markListPage':
            builder = (BuildContext _) => new MarksListView();
            break;
          case 'mark/markViewPage':
            builder = (BuildContext _) => new MarksViewPage();
            break;
          case 'mark/Addpage':
            builder = (BuildContext _) => new MarksaddPage();
            break;
          case 'mark/editpage':
            builder = (BuildContext _) => new Markseditpage();
            break;
          case 'school/schoolListPage':
            builder = (BuildContext _) => new SchoolListView();
            break;
          case 'school/Addpage':
            builder = (BuildContext _) => new SchoolAddPage();
            break;
          case 'school/schoolViewPage':
            builder = (BuildContext _) => new SchoolViewPage();
            break;
          case 'school/editpage':
            builder = (BuildContext _) => new SchoolEditPage();
            break;
          case 'Admin/Notification':
            builder = (BuildContext _) => new NotificationPage();
            break;
          case 'Admin/About':
            builder = (BuildContext _) => new AboutPage();
            break;
          case 'Admin/Privacy policy':
            builder = (BuildContext _) => new Privacy_policy();
            break;
          case 'Admin/auth/Signup':
            builder = (BuildContext _) => new SignUpPage();
            break;
          case '/Announcements/pre-schoolList':
            builder = (BuildContext _) => new PreschoolListView();
            break;
          case '/Announcements/AnnouncementslistPage':
            builder = (BuildContext _) => new AnnouncementListView();
            break;
          case '/Announcements/AnnouncementsView':
            builder = (BuildContext _) => new AnnouncementView();
            break;
          case '/Announcements/AddAnnouncements':
            builder = (BuildContext _) => new AddAnnouncement();
            break;
          case '/Announcements/EditAnnouncements':
            builder = (BuildContext _) => new EditAnnouncement();
            break;

          default:
            throw new Exception('Invalid route: ${settings.name}');
        }
        return new MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
