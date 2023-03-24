// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:araz_mobile_application/Helper/theme_helper.dart';
import 'package:araz_mobile_application/Model/Announcement.dart';
import 'package:araz_mobile_application/Model/School.dart';
import 'package:araz_mobile_application/Repository/Announcement.dart';
import 'package:araz_mobile_application/Repository/SchoolRepository.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';

import 'package:araz_mobile_application/Widgets/HeaderWidget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class EditAnnouncement extends StatefulWidget {
  // final School userR;
  EditAnnouncement({
    Key? key,
    // required this.userR,
  }) : super(key: key);

  @override
  State<EditAnnouncement> createState() => _SchoolEditPageState();
}

class _SchoolEditPageState extends State<EditAnnouncement> {
  TextEditingController _title = TextEditingController();
  TextEditingController _message = TextEditingController();
  TextEditingController _date = TextEditingController();

  var AnnouncementRepo = AnnouncementRepository();
  late Announcement announcement;
  // late School argsedit;
  final _formKeyupdate = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void SchoolUpdateHandler() async {
    final args =
        (ModalRoute.of(context)!.settings.arguments ?? '') as Announcement;
    var newAnnouncement = new Announcement(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      schoolid: args.schoolid,
      date: _date.text,
      title: _title.text,
      message: _message.text,
    );
    print(newAnnouncement);
    AnnouncementRepo.updateAnnouncement(newAnnouncement);
  }

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _message.dispose();
    _date.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final argsEdit =
        (ModalRoute.of(context)!.settings.arguments ?? '') as Announcement;
    _title.text = argsEdit.title;
    _message.text = argsEdit.message;
    _date.text = argsEdit.date;

    return Scaffold(
      appBar: CustomAppBar(context, "Edituserpage"),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKeyupdate,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
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
                                  "lib/assets/images/School.png",
                                  width: 80,
                                  height: 80,
                                ),

                                // Icon(
                                //   Icons.person,
                                //   color: Colors.grey.shade300,
                                //   size: 80.0,
                                // ),
                              ),
                              // Container(
                              //   padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                              //   child: Icon(
                              //     Icons.add_circle,
                              //     color: Colors.grey.shade700,
                              //     size: 25.0,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Title',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _title,
                            decoration: ThemeHelper().textInputDecoration(
                              'Title',
                            ),
                            validator: (val) {
                              if ((val!.isEmpty)) {
                                return "Enter a valid Title";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Date',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          controller: _date,
                          decoration: InputDecoration(
                            // border: InputBorder.none,
                            hintText: "Date",
                            hintStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans',
                            ),
                            // counterText: lableText,
                            fillColor: Colors.white,

                            labelStyle: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans',
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                            // focusedBorder: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 0, 202, 248)),
                            ),
                            // enabledBorder: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.grey)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2.0)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2.0)),
                          ),
                          onTap: () async {
                            DateTime? date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            if (date != null) {
                              setState(() {
                                _date.text = "";
                                _date.text =
                                    "${date!.day.toString()}- ${date!.month.toString()}-${date!.year.toString()}";
                                print(_date.text);
                              });

                              // _date.text = "${date.toLocal()}";
                            }
                          },
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Message',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _message,
                            decoration: ThemeHelper().textInputDecoration(
                              'Message',
                            ),
                            validator: (val) {
                              if ((val!.isEmpty)) {
                                return "Enter a valid Message";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 17.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Update".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKeyupdate.currentState!.validate()) {
                                SchoolUpdateHandler();
                       
                                MotionToast.success(
                                  title: const Text(
                                    'Success',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  description: const Text(
                                    'sucessfully added school details  ',
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  position: MotionToastPosition.bottom,
                                  barrierColor: Colors.black.withOpacity(0.3),
                                  width: 300,
                                  height: 80,
                                  dismissable: false,
                                ).show(context);
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
