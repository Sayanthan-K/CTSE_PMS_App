import 'package:araz_mobile_application/Helper/theme_helper.dart';
import 'package:araz_mobile_application/Model/Marks.dart';
import 'package:araz_mobile_application/Repository/MarksRepository.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:araz_mobile_application/Widgets/HeaderWidget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class MarksaddPage extends StatefulWidget {
  const MarksaddPage({super.key});

  @override
  State<MarksaddPage> createState() => _MarksaddPageState();
}

class _MarksaddPageState extends State<MarksaddPage> {
  // String? selectedValue;
  final List<String> items = [
    'Teacher',
    'Parents',
    'Zone',
    'Item4',
    'Item5',
  ];

  TextEditingController _first_Name = TextEditingController();
  TextEditingController _last_Name = TextEditingController();
  TextEditingController _maths = TextEditingController();
  TextEditingController _science = TextEditingController();
  TextEditingController _english = TextEditingController();
  late Marks newMarks;

  var MarksRepo = MarksRepository();

  void MarksAddHandler() async {
    // ignore: unnecessary_null_comparison

    newMarks = Marks(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      first_Name: _first_Name.text,
      last_Name: _last_Name.text,
      maths: _maths.text,
      english: _english.text,
      science: _science.text,
    );
    if (_first_Name.text == null &&
        _last_Name.text == null &&
        _maths.text == null &&
        _english.text == null &&
        _science.text == null) {
      MotionToast.error(
        title: const Text(
          'Error',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        description: const Text(
          'Must filled all filed ',
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
    MarksRepo.addMarks(newMarks);
    print("sayanthan");
    // _titleController.clear();
    // _descriptionController.clear();
    setState(() {});
  }

  final _formKeyAdd = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _first_Name.dispose();
    _last_Name.dispose();
    _maths.dispose();
    _science.dispose();
    _english.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _first_Name.text = '${widget.userR.first_Name}';
    // _last_Name.text = '${widget.userR.last_Name}';
    // _email.text = '${widget.userR.email}';
    // _Markstype.text = '${widget.userR.usertype}';
    // _maths.text = '${widget.userR.maths}';
    // _science.text = '${widget.userR.age}';
    // _english.text = '${widget.userR.english}';
    // _about_me.text = '${widget.userR.about_me}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "Add marks page"),
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
                                  "lib/assets/images/Marks.png",
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
                            'First Name',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _first_Name,
                            decoration: ThemeHelper().textInputDecoration(
                              'First Name',
                            ),
                            validator: (val) {
                              if ((val!.isEmpty)) {
                                return "Enter a valid First Name";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Last Name',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _last_Name,
                            decoration:
                                ThemeHelper().textInputDecoration('Last Name'),
                            validator: (val) {
                              if ((val!.isEmpty)) {
                                return "Enter a valid Last Name";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Maths',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                              controller: _maths,
                              decoration:
                                  ThemeHelper().textInputDecoration("Maths"),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please enter Maths marks';
                                } else if (!RegExp(r"^(\d+)*$").hasMatch(val)) {
                                  return 'Please enter valid marks';
                                }
                                return null;
                              }),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Science',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                              controller: _science,
                              decoration:
                                  ThemeHelper().textInputDecoration("Science"),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please enter marks';
                                } else if (!RegExp(r"^(\d+)*$").hasMatch(val)) {
                                  return 'Please enter valid marks';
                                }
                                return null;
                              }),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'English',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                              controller: _english,
                              decoration:
                                  ThemeHelper().textInputDecoration("English"),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please enter marks';
                                } else if (!RegExp(r"^(\d+)*$").hasMatch(val)) {
                                  return 'Please enter valid marks';
                                }
                                return null;
                              }),
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
                                "addMarks".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKeyAdd.currentState!.validate()) {
                                MarksAddHandler();
                                Navigator.pushNamed(
                                  context,
                                  'mark/markListPage',
                                );
                                MotionToast.success(
                                  title: const Text(
                                    'Success',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  description: const Text(
                                    'sucess fully added user details  ',
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
