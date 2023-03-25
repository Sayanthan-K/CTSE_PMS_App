import 'package:araz_mobile_application/Model/Announcement.dart';

import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:araz_mobile_application/Widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnnouncementView extends StatefulWidget {
  const AnnouncementView({super.key});

  @override
  State<AnnouncementView> createState() => _AnnouncementViewState();
}

class _AnnouncementViewState extends State<AnnouncementView> {
  // late Announcement announcement;
  // Initial Selected Value

  @override
  Widget build(BuildContext context) {
    final announcement =
        (ModalRoute.of(context)!.settings.arguments ?? '') as Announcement;
    return Scaffold(
      appBar: CustomAppBar(context, "Announcement details"),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "lib/assets/images/announcement.png",
                      width: 80,
                      height: 80,
                    ),

                    // Icon(
                    //   Icons.person,
                    //   size: 80,
                    //   color: Colors.grey.shade300,
                    // ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: announcement.title,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 8.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Announcements Information",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          color: Color.fromARGB(255, 216, 226, 223),
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(2),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.white,
                                      tiles: [
                                        ListTile(
                                          leading: Icon(Icons.title),
                                          title: Text("Title"),
                                          subtitle: Text(announcement.title),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.description),
                                          title: Text("message"),
                                          subtitle: Text(announcement.message),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.date_range),
                                          title: Text("Date"),
                                          subtitle: Text(announcement.date),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.bottomRight,
                                  child: FloatingActionButton(
                                    foregroundColor: Colors.white,
                                    hoverColor: Colors.white,
                                    tooltip: "edit Announcements details",
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/Announcements/EditAnnouncements',
                                        arguments: announcement,
                                      );
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
