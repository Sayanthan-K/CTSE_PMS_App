import 'package:araz_mobile_application/Constants/Colors.dart';
import 'package:araz_mobile_application/Helper/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Drawer Topnavigationbar(context, _drawerIconSize, _drawerFontSize) {
  return Drawer(
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
            0.0,
            1.0
          ],
              colors: [
            Theme.of(context).primaryColor.withOpacity(0),
            Theme.of(context).accentColor.withOpacity(0),
          ])),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                colors: [primaryColor, accentColor],
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                "lib/assets/images/logoW.png",
                width: 440.0,
                height: 440.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.rule,
              size: _drawerIconSize,
              // color: Colors.black,
            ),
            title: const Text(
              'Privacy policy',
              style: TextStyle(
                fontSize: 17,
                // color: Theme.of(context).accentColor,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                'Admin/Privacy policy',
              );
              // Admin/RuleRegulation
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.book_sharp,
              size: _drawerIconSize,
            ),
            title: Text(
              'About Page',
              style: TextStyle(
                fontSize: _drawerFontSize,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                'Admin/About',
              );
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
        ],
      ),
    ),
  );
}
