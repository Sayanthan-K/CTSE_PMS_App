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
                "lib/assets/images/title.png",
                width: 470.0,
                height: 470.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.my_library_books,
              size: _drawerIconSize,
              // color: Colors.black,
            ),
            title: const Text(
              'AddressBook',
              style: TextStyle(
                fontSize: 17,
                // color: Theme.of(context).accentColor,
              ),
            ),
            onTap: () {},
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.payment,
              size: _drawerIconSize,
              // color: Colors.black,
            ),
            title: const Text(
              'Payment',
              style: TextStyle(
                fontSize: 17,
                // color: Theme.of(context).accentColor,
              ),
            ),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: ((context) => SettingPage())));
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.delivery_dining_outlined,
              size: _drawerIconSize,
              // color: Colors.black,
            ),
            title: const Text(
              'Your Order',
              style: TextStyle(
                fontSize: 17,
                // color: Theme.of(context).accentColor,
              ),
            ),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: ((context) => SettingPage())));
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.security,
              size: _drawerIconSize,
              // color: Colors.black,
            ),
            title: const Text(
              'security',
              style: TextStyle(
                fontSize: 17,
                // color: Theme.of(context).accentColor,
              ),
            ),
            onTap: () {},
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
              'Guidelines for app',
              style: TextStyle(
                fontSize: _drawerFontSize,
              ),
            ),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: ((context) => Guidelines_for_app())));
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              size: _drawerIconSize,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: _drawerFontSize,
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ThemeHelper().LogoutalartDialog(
                    "Logout comformation",
                    "Are sure want to logout",
                    context,
                    "cancel",
                    "Logout".toUpperCase(),
                    () {},
                    () {},
                  );
                },
              );
            },
          ),
        ],
      ),
    ),
  );
}
