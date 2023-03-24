import 'package:araz_mobile_application/Constants/Colors.dart';

import 'package:araz_mobile_application/Helper/theme_helper.dart';
import 'package:araz_mobile_application/Widgets/Bottom_navigation_Bar.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:araz_mobile_application/Widgets/HeaderWidget.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  final navigatorKey = GlobalKey<NavigatorState>();
  final _formKeySignIN = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  double _headerHeight = 250;
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
      MotionToast.success(
        title: const Text(
          'Successfully signIN',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        description: const Text(
          'Success fully SignIN ',
          style: TextStyle(fontSize: 12),
        ),
        layoutOrientation: ToastOrientation.rtl,
        animationType: AnimationType.fromRight,
        dismissable: true,
      ).show(context);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'error',
          message: '${e.message}',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/nav', (Route<dynamic> route) => false);

    // MotionToast.success(
    //   title: const Text(
    //     'Successfully signIN',
    //     style: TextStyle(fontWeight: FontWeight.bold),
    //   ),
    //   description: const Text(
    //     'Success fully SignIN ',
    //     style: TextStyle(fontSize: 12),
    //   ),
    //   layoutOrientation: ToastOrientation.rtl,
    //   animationType: AnimationType.fromRight,
    //   dismissable: true,
    // ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_label

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(
                _headerHeight,
                true,
                Icons.login_rounded,
              ),
            ),
            SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Image.asset(
                      "lib/assets/images/logoB.png",
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Signin into your account',
                      style: TextStyle(
                        color: Color.fromARGB(255, 63, 56, 56),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Form(
                        key: _formKeySignIN,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                controller: _email,
                                decoration:
                                    ThemeHelper().textInputDecoration('Email'),
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
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                controller: _password,
                                obscureText: true,
                                decoration: ThemeHelper()
                                    .textInputDecoration('Password'),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter your password";
                                  } else if (!RegExp(
                                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                      .hasMatch(val)) {
                                    return "Please enter vaild your password";
                                  }
                                  return null;
                                },
                              ),
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    'Sign In'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKeySignIN.currentState!.validate()) {
                                    signIn();
                                    // MotionToast.success(
                                    //   title: const Text(
                                    //     'Successfully signIN',
                                    //     style: TextStyle(
                                    //         fontWeight: FontWeight.bold),
                                    //   ),
                                    //   description: const Text(
                                    //     'Success fully SignIN ',
                                    //     style: TextStyle(fontSize: 12),
                                    //   ),
                                    //   layoutOrientation: ToastOrientation.rtl,
                                    //   animationType: AnimationType.fromRight,
                                    //   dismissable: true,
                                    // ).show(context);
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "Don\'t have an account? ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(
                                  text: 'Create',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                        context,
                                        'Admin/auth/Signup',
                                      );
                                    },
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor),
                                ),
                              ])),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
