// import 'dart:js';

import 'package:araz_mobile_application/Constants/Colors.dart';
import 'package:araz_mobile_application/Screens/SchoolAddPage.dart';
import 'package:araz_mobile_application/Screens/SchoolEditPage.dart';
import 'package:araz_mobile_application/Screens/SchoolListView.dart';
import 'package:araz_mobile_application/Screens/SchoolViewPage.dart';
import 'package:araz_mobile_application/Screens/SplashScreen.dart';
import 'package:araz_mobile_application/Screens/UserListView.dart';
import 'package:araz_mobile_application/Screens/UserViewPage.dart';
import 'package:araz_mobile_application/Screens/Usereditpage.dart';
import 'package:araz_mobile_application/Screens/useraddpage.dart';
import 'package:araz_mobile_application/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(LoginUiApp());
// }
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

      // initialRoute: '/',
      // routes: {
      //   '/': (context) => SplashScreen(title: "title"),
      //   'user/userListPage': (context) => UserListView(),
      // },
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext _) => SplashScreen(title: "title");
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

          default:
            throw new Exception('Invalid route: ${settings.name}');
        }
        return new MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
