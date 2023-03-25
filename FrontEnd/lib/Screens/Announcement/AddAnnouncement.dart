import 'package:araz_mobile_application/Helper/theme_helper.dart';
import 'package:araz_mobile_application/Model/Announcement.dart';
import 'package:araz_mobile_application/Model/School.dart';
import 'package:araz_mobile_application/Repository/Announcement.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:araz_mobile_application/Widgets/HeaderWidget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class AddAnnouncement extends StatefulWidget {
  const AddAnnouncement({super.key});

  @override
  State<AddAnnouncement> createState() => _AddAnnouncementState();
}

class _AddAnnouncementState extends State<AddAnnouncement> {
  TextEditingController _title = TextEditingController();
  TextEditingController _message = TextEditingController();
  TextEditingController _date = TextEditingController();

  var AnnouncementRepo = AnnouncementRepository();

  void SchoolAddHandler() async {
    School sid = (ModalRoute.of(context)!.settings.arguments ?? '') as School;
    var newAnnouncement = new Announcement(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      schoolid: sid.id,
      date: _date.text,
      title: _title.text,
      message: _message.text,
    );

    AnnouncementRepo.addAnnouncement(newAnnouncement);
    print(newAnnouncement);
  }

  final _formKeyAdd = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final schoolId =
        (ModalRoute.of(context)!.settings.arguments ?? '') as School;
    return Scaffold(
      appBar: CustomAppBar(context, "Add Announcement"),
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
                    key: _formKeyAdd,
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
                                  "lib/assets/images/announcement.png",
                                  width: 80,
                                  height: 80,
                                ),
                              ),
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
                              // _date.text = "${date.toString()}";
                              _date.text =
                                  "${date.day.toString()}- ${date.month.toString()}-${date.year.toString()}";
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
                        SizedBox(height: 10.0),
                        SizedBox(height: 10.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "add".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKeyAdd.currentState!.validate()) {
                                SchoolAddHandler();
                                Navigator.pushNamed(
                                  context,
                                  '/Announcements/AnnouncementslistPage',
                                  arguments: schoolId,
                                );
                                MotionToast.success(
                                  title: const Text(
                                    'Successfully added the Annoucement',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  description: const Text(
                                    'Successfully added the Annoucement',
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
