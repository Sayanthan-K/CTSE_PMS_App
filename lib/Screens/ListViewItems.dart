import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListViewItems extends StatefulWidget {
  const ListViewItems({super.key});

  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "List views"),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  color: Color.fromARGB(255, 99, 178, 186),
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    textColor: Color.fromARGB(255, 23, 22, 17),
                    title: Text("List item $index"),
                    subtitle: Text("hello"),
                    leading: const Icon(Icons.library_books_outlined),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                      // color: Colors.black,
                      iconSize: 30,
                      onPressed: () {},
                    ),
                  ),
                );
              }),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {},
            tooltip: "add list item",
            child: Text(
              "+",
              style: TextStyle(fontSize: 35),
            ),
          ),
        ),
      ]),
    );
  }
}
