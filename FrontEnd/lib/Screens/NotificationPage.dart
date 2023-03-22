import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    const data = [
      {
        "title": "new User added",
        "message": " recenly new user added by sayanthan",
        "date": "12/03/2023",
        "time": "12.30pm",
      },
      {
        "title": "new School added",
        "message": " recenly new School added by sayanthan",
        "date": "12/03/2023",
        "time": "1.30pm",
      },
      {
        "title": "new  added",
        "message": " recenly new user added by sayanthan",
        "date": "13/03/2023",
        "time": "2.30pm",
      },
      {
        "title": "new User added",
        "message": " recenly new user added by sayanthan",
        "date": "15/03/2023",
        "time": "3.30pm",
      },
    ];
    return Scaffold(
      appBar: CustomAppBar(context, "Notification"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: Colors.lightGreen[400],
            color: Color.fromARGB(255, 255, 255, 255),
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.all(
                Radius.circular(15.0) //                 <--- border radius here
                ),
          ),
          child: Container(
            width: double.infinity,
            height: 640,
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Scrollbar(
                  child: Container(
                    height: 600,
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: ((context, index) {
                          return Card(
                            child: Container(
                              color: Color.fromARGB(255, 76, 164, 174),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.notifications_active,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            ' ${data[index]["title"]}',
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Open Sans',
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            ' ${data[index]["title"]}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Open Sans',
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.white70),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.not_started,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        '12/02/2023',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '2.30Pm',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
