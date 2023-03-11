// import 'dart:js';

import 'package:araz_mobile_application/Constants/Colors.dart';
import 'package:araz_mobile_application/Screens/SplashScreen.dart';
import 'package:araz_mobile_application/Screens/UserListView.dart';
import 'package:araz_mobile_application/Screens/UserViewPage.dart';
import 'package:araz_mobile_application/Screens/Usereditpage.dart';
import 'package:araz_mobile_application/Screens/useraddpage.dart';
import 'package:flutter/material.dart';

void main() {
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

          default:
            throw new Exception('Invalid route: ${settings.name}');
        }
        return new MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
