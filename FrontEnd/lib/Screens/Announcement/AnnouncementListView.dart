import 'dart:async';

import 'package:araz_mobile_application/Model/Announcement.dart';
import 'package:araz_mobile_application/Model/School.dart';
import 'package:araz_mobile_application/Repository/Announcement.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:araz_mobile_application/Widgets/custom_AlertDialogbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class AnnouncementListView extends StatefulWidget {
  const AnnouncementListView({super.key});

  @override
  State<AnnouncementListView> createState() => _AnnouncementListViewState();
}

class _AnnouncementListViewState extends State<AnnouncementListView> {
  late Stream<List<Announcement>> Announcement_list;

  var Announcement_Repo = AnnouncementRepository();

  void deleteAnnouncement(Announcement id) {
    setState(() {
      Announcement_Repo.deleteAnnouncement(id);
      Navigator.of(context).pop();
      MotionToast.delete(
        title: const Text(
          'Successfully Deleted ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        description: const Text('The Anncouncement is deleted'),
        animationType: AnimationType.fromTop,
        position: MotionToastPosition.top,
      ).show(context);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      final school =
          (ModalRoute.of(context)!.settings.arguments ?? '') as School;
      print(school.id);

      setState(() {
        Announcement_list = Announcement_Repo.AllAnnouncement(school.id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final schoolId =
        (ModalRoute.of(context)!.settings.arguments ?? '') as School;

    final customheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(context, "Announcements"),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.all(10),
          height: customheight * 0.90,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder(
              stream: Announcement_list,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.isEmpty) {
                    return Center(
                      child: Text(
                        "No Announcements !!!",
                        style: TextStyle(
                          fontFamily: 'Opensan',
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    );
                  }
                  print(snapshot.hasData);

                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(3),
                          margin: EdgeInsets.all(3),
                          height: customheight * 0.13,
                          width: MediaQuery.of(context).size.width,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/Announcements/AnnouncementsView',
                                arguments: snapshot.data[index],
                              );
                            },
                            child: Card(
                              color: Color.fromARGB(255, 76, 164, 174),
                              child: ListTile(
                                textColor: Colors.white,
                                leading: Image.asset(
                                  "lib/assets/images/announcement.png",
                                  width: 40.0,
                                  height: 40.0,
                                ),
                                subtitle: Flexible(
                                  fit: FlexFit.loose,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${snapshot.data![index].message}' +
                                              "\n" +
                                              '${snapshot.data![index].date}' +
                                              "  ",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                title: Flexible(
                                  fit: FlexFit.loose,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              '${snapshot.data![index].title}' +
                                                  " ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  // color: Colors.black,
                                  iconSize: 33,
                                  color: Colors.red[500],
                                  onPressed: () {
                                    setState(() {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              custom_AlertDialogbox(
                                                  bodymessgae: "Are you sure ?",
                                                  title: "Alert",
                                                  leftbuttontext: "Cancel",
                                                  leftOnTap: (() {
                                                    Navigator.of(context).pop();
                                                  }),
                                                  Righttbuttontext: "Yes",
                                                  RightOnTap: (() {
                                                    deleteAnnouncement(
                                                        snapshot.data![index]);
                                                  })));
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(
                  child: const CircularProgressIndicator(),
                );
              }),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/Announcements/AddAnnouncements',
                arguments: schoolId,
              );
            },
            tooltip: "add list item",
            child: Text(
              "+",
              style: TextStyle(fontSize: 35),
            ),
          ),
        ),
      ]),
    );
  }
}
