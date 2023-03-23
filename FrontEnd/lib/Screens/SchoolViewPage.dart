import 'package:araz_mobile_application/Model/School.dart';
import 'package:araz_mobile_application/Screens/SchoolEditPage.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:araz_mobile_application/Widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SchoolViewPage extends StatefulWidget {
  const SchoolViewPage({super.key});

  @override
  State<SchoolViewPage> createState() => _SchoolViewPageState();
}

class _SchoolViewPageState extends State<SchoolViewPage> {
  // Initial Selected Value

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)!.settings.arguments ?? '') as School;
    return Scaffold(
      appBar: CustomAppBar(context, "School details"),
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
                      //image
                      "lib/assets/images/School.png",
                      width: 80,
                      height: 80,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: args.name,
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
                            "School Information",
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
                                  //show details of pre-school
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.white,
                                      tiles: [
                                        ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text("Email"),
                                          subtitle: Text(args.email),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text("Phone"),
                                          subtitle: Text(args.mobile_number),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.location_on),
                                          title: Text("Address"),
                                          subtitle: Text(args.address),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  // implementing edit button for edit school
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.bottomRight,
                                  child: FloatingActionButton(
                                    foregroundColor: Colors.white,
                                    hoverColor: Colors.white,
                                    tooltip: "edit school details",
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        //navigate to edit page
                                        context,
                                        'school/editpage',
                                        arguments: args,
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
