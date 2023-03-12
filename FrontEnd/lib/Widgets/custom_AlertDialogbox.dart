// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class custom_AlertDialogbox extends StatelessWidget {
  final String bodymessgae;
  final String title;
  final String leftbuttontext;
  final String Righttbuttontext;
  final VoidCallback leftOnTap;
  final VoidCallback RightOnTap;

  const custom_AlertDialogbox({
    Key? key,
    required this.bodymessgae,
    required this.title,
    required this.leftbuttontext,
    required this.leftOnTap,
    required this.Righttbuttontext,
    required this.RightOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(bodymessgae),
      title: Text(title),
      actions: [
        TextButton(
          child: Text(
            leftbuttontext,
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 17),
          ),
          // style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Colors.black38)),
          onPressed: leftOnTap,
          // onPressed: () {
          //   Navigator.of(context).pop();
          // },
        ),
        TextButton(
          child: Text(
            Righttbuttontext,
            style: TextStyle(
                color: Color.fromARGB(255, 6, 106, 104), fontSize: 17),
          ),
          // style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Colors.black38)),
          onPressed: RightOnTap,
          // onPressed: () {
          //   Navigator.of(context).pop();
          // },
        ),
      ],
    );
  }
}
