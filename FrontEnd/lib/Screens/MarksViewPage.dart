import 'package:araz_mobile_application/Model/Marks.dart';
import 'package:araz_mobile_application/Screens/Markseditpage.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:araz_mobile_application/Widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MarksViewPage extends StatefulWidget {
  const MarksViewPage({super.key});

  @override
  State<MarksViewPage> createState() => _MarksViewPageState();
}

class _MarksViewPageState extends State<MarksViewPage> {
  // Initial Selected Value

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)!.settings.arguments ?? '') as Marks;
    return Scaffold(
      appBar: CustomAppBar(context, "Marks details"),
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
                      "lib/assets/images/Marks.png",
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
                          text: args.first_Name,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: args.last_Name,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
                            "Marks Information",
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
                                          leading: Icon(Icons.grade),
                                          title: Text("Maths"),
                                          subtitle: Text(args.maths),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.grade),
                                          title: Text("Science"),
                                          subtitle: Text(args.science),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.grade),
                                          title: Text("English"),
                                          subtitle: Text(args.english),
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
                                    tooltip: "edit marks details",
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        'mark/editpage',
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
