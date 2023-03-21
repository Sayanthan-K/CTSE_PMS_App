// import 'dart:js';

import 'package:araz_mobile_application/Constants/Colors.dart';
import 'package:araz_mobile_application/Screens/MarksAddPage.dart';
import 'package:araz_mobile_application/Screens/MarksEditPage.dart';
import 'package:araz_mobile_application/Screens/MarksListView.dart';
import 'package:araz_mobile_application/Screens/MarksViewPage.dart';
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
          default:
            throw new Exception('Invalid route: ${settings.name}');
        }
        return new MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
