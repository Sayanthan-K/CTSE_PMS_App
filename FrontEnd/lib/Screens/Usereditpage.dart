// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:araz_mobile_application/Helper/theme_helper.dart';

import 'package:araz_mobile_application/Widgets/HeaderWidget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Model/User.dart';

class Usereditpage extends StatefulWidget {
  // final User userR;
  Usereditpage({
    Key? key,
    // required this.userR,
  }) : super(key: key);

  @override
  State<Usereditpage> createState() => _UsereditpageState();
}

class _UsereditpageState extends State<Usereditpage> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
  ];
  String? selectedValue;
  // final UserService authService = UserService();
  TextEditingController _first_Name = TextEditingController();
  TextEditingController _last_Name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _Usertype = TextEditingController();
  TextEditingController _mobile_number = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _address = TextEditingController();

  final _formKeyupdate = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _first_Name.dispose();
    _last_Name.dispose();
    _email.dispose();
    _Usertype.dispose();
    _mobile_number.dispose();
    _age.dispose();
    _address.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _first_Name.text = '${widget.userR.first_Name}';
    // _last_Name.text = '${widget.userR.last_Name}';
    // _email.text = '${widget.userR.email}';
    // _Usertype.text = '${widget.userR.usertype}';
    // _mobile_number.text = '${widget.userR.mobile_number}';
    // _age.text = '${widget.userR.age}';
    // _address.text = '${widget.userR.address}';
    // _about_me.text = '${widget.userR.about_me}';
  }

  void UpdateClick() {
    User user = User(
      id: "",
      first_Name: _first_Name.text,
      last_Name: _last_Name.text,
      email: _email.text,
      usertype: _Usertype.text,
      mobile_number: _mobile_number.text,
      age: _age.text,
      address: _address.text,
    );
    print(user);
    // final response = UserService.UpdateUser(
    //         '/api/v1/users/63ece5caa1c6f21a57859e3e', user, context)
    //     .then((response) {
    //   print(response);
    // }).catchError((error) {
    //   print(error);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Update page".toUpperCase(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.1,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ])),
        ),
      ),
      backgroundColor: Colors.white,
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
                                  "lib/assets/images/User.png",
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
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'UserType',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as String;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                  color: Colors.white,
                                ),
                                elevation: 2,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  size: 40,
                                  Icons.arrow_drop_down,
                                ),
                                iconSize: 14,
                                iconEnabledColor: Color.fromARGB(255, 0, 0, 0),
                                iconDisabledColor: Colors.grey,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.94,
                                padding: null,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // color: Colors.redAccent,
                                ),
                                elevation: 8,
                                offset: const Offset(-20, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ),

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
                            'Age',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            controller: _age,
                            decoration:
                                ThemeHelper().textInputDecoration('Age'),
                            validator: (val) {
                              if ((val!.isEmpty)) {
                                return "Enter a valid age";
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
                                UpdateClick();
                                Navigator.of(context).pop(context);
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
