import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar CustomAppBar(context, Titletext) {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  return AppBar(
    title: Row(children: [
      Container(
        alignment: Alignment.center,
        width: 29,
        height: 26,
        margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        padding: EdgeInsets.all(1),
        child: Image.asset(
          "lib/assets/images/logo.png",
        ),
      ),
      Text(
        Titletext,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ]),
    elevation: 0.1,
    iconTheme: IconThemeData(color: Colors.white),
    flexibleSpace: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            // HexColor('#41fc03'),
            // HexColor('#03fc90'),
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ])),
    ),
    actions: [
      Container(
        margin: EdgeInsets.only(
          top: 8,
          right: 16,
        ),
        child: Stack(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              iconSize: 30,
              onPressed: () => {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => Notification_pages(),
                // ))
              },
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 28, 25, 19),
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: Text(
                  '3',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          top: 8,
          right: 16,
        ),
        child: Stack(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              iconSize: 30,
              onPressed: () => {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => Notification_pages(),
                // ))
              },
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 28, 25, 19),
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: Text(
                  '2',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}
