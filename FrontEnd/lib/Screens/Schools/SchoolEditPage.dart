// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:araz_mobile_application/Helper/theme_helper.dart';
import 'package:araz_mobile_application/Repository/SchoolRepository.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';

import 'package:araz_mobile_application/Widgets/HeaderWidget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../Model/School.dart';

class SchoolEditPage extends StatefulWidget {
  // final School userR;
  SchoolEditPage({
    Key? key,
    // required this.userR,
  }) : super(key: key);

  @override
  State<SchoolEditPage> createState() => _SchoolEditPageState();
}

class _SchoolEditPageState extends State<SchoolEditPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile_number = TextEditingController();
  TextEditingController _address = TextEditingController();
  var SchoolRepo = SchoolRepository();
  late School newSchool;
  late School argsedit;
  final _formKeyupdate = GlobalKey<FormState>();
  final List<String> items = [
    'Teacher',
    'Parents',
    'Zone',
    'Item4',
    'Item5',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _addRecipeClick() {}
  // void deletelist(String id) {
  //   setState(() {
  //     Ingredients.removeWhere((recipe) => recipe == id);
  //   });
  // }

  void SchoolUpdateHandler() async {
    // ignore: unnecessary_null_comparison
    argsedit = (ModalRoute.of(context)!.settings.arguments ?? '') as School;
    newSchool = School(
      id: argsedit.id,
      name: _name.text,
      email: _email.text,
      mobile_number: _mobile_number.text,
      address: _address.text,
    );
    if (_name.text == null &&
        _email.text == null &&
        _mobile_number.text == null &&
        _address.text == null) {
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
    SchoolRepo.addSchool(newSchool);
    print("Ananthan");
    // _titleController.clear();
    // _descriptionController.clear();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _mobile_number.dispose();
    _address.dispose();
  }

  @override
  Widget build(BuildContext context) {
    argsedit = (ModalRoute.of(context)!.settings.arguments ?? '') as School;
    _name.text = argsedit.name;
    _email.text = argsedit.email;
    _mobile_number.text = argsedit.mobile_number;
    _address.text = argsedit.address;

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
                            'Name',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _name,
                            decoration: ThemeHelper().textInputDecoration(
                              'Name',
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
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'E-mail',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _email,
                            decoration:
                                ThemeHelper().textInputDecoration("E-mail"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter a email address";
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                  .hasMatch(val)) {
                                return "Enter a valid email address";
                              } else {
                                return null;
                              }
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        // SizedBox(height: 10.0),
                        // Container(
                        //   child: TextFormField(
                        //     controller: _password,
                        //     obscureText: true,
                        //     decoration:
                        //         ThemeHelper().textInputDecoration("Password*"),
                        //     validator: (val) {
                        //       if (val!.isEmpty) {
                        //         return "Please enter your password";
                        //       } else if (!RegExp(
                        //               r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        //           .hasMatch(val)) {
                        //         return "Please enter vaild your password";
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        //   decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        // ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   child: DropdownButtonHideUnderline(
                        //     child: DropdownButton2(
                        //       isExpanded: true,
                        //       hint: Row(
                        //         children: const [
                        //           Expanded(
                        //             child: Text(
                        //               'Select Item',
                        //               style: TextStyle(
                        //                 fontSize: 14,
                        //                 fontWeight: FontWeight.bold,
                        //                 color: Colors.black,
                        //               ),
                        //               overflow: TextOverflow.ellipsis,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       items: items
                        //           .map((item) => DropdownMenuItem<String>(
                        //                 value: item,
                        //                 child: Text(
                        //                   item,
                        //                   style: const TextStyle(
                        //                     fontSize: 14,
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.black,
                        //                   ),
                        //                   overflow: TextOverflow.ellipsis,
                        //                 ),
                        //               ))
                        //           .toList(),
                        //       value: selectedValue,
                        //       onChanged: (value) {
                        //         setState(() {
                        //           selectedValue = value as String;
                        //         });
                        //       },
                        //       buttonStyleData: ButtonStyleData(
                        //         height: 50,
                        //         width: 160,
                        //         padding:
                        //             const EdgeInsets.only(left: 14, right: 14),
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(14),
                        //           border: Border.all(
                        //             color: Colors.black26,
                        //           ),
                        //           color: Colors.white,
                        //         ),
                        //         elevation: 2,
                        //       ),
                        //       iconStyleData: const IconStyleData(
                        //         icon: Icon(
                        //           size: 40,
                        //           Icons.arrow_drop_down,
                        //         ),
                        //         iconSize: 14,
                        //         iconEnabledColor: Color.fromARGB(255, 0, 0, 0),
                        //         iconDisabledColor: Colors.grey,
                        //       ),
                        // dropdownStyleData: DropdownStyleData(
                        //   maxHeight:
                        //       MediaQuery.of(context).size.height * 0.25,
                        //   width: MediaQuery.of(context).size.width * 0.94,
                        //   padding: null,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(14),
                        //     // color: Colors.redAccent,
                        //   ),
                        //         elevation: 8,
                        //         offset: const Offset(-20, 0),
                        //         scrollbarTheme: ScrollbarThemeData(
                        //           radius: const Radius.circular(40),
                        //           thickness:
                        //               MaterialStateProperty.all<double>(6),
                        //           thumbVisibility:
                        //               MaterialStateProperty.all<bool>(true),
                        //         ),
                        //       ),
                        //       menuItemStyleData: const MenuItemStyleData(
                        //         height: 40,
                        //         padding: EdgeInsets.only(left: 14, right: 14),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Mobile Number',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                              controller: _mobile_number,
                              decoration: ThemeHelper()
                                  .textInputDecoration("Mobile Number"),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please enter mobile number';
                                } else if (val.length != 10) {
                                  return 'Please enter 10 digit mobile number';
                                } else if (!RegExp(r"^(\d+)*$").hasMatch(val)) {
                                  return 'Please enter valid mobile number';
                                }
                                return null;
                              }
                              //   if ((val!.length == 0) &&
                              //       !RegExp(r"^(\d+)*$").hasMatch(val)) {
                              //     return "Enter a valid phone number";
                              //   }
                              //   return null;
                              // },
                              ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Address',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _address,
                            decoration:
                                ThemeHelper().textInputDecoration('address'),
                            validator: (val) {
                              if ((val!.isEmpty)) {
                                return "Enter a valid address";
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
                                "UpdateSchool".toUpperCase(),
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
                                Navigator.pushNamed(
                                  context,
                                  'school/schoolListPage',
                                  arguments: newSchool,
                                );
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
