import 'package:araz_mobile_application/Screens/UserViewPage.dart';
import 'package:araz_mobile_application/Screens/useraddpage.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
    final customheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(context, "ALL User views"),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.all(10),
          height: customheight * 0.90,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(3),

                  height: customheight * 0.12,
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => UserViewPage(),
                      // ));
                      Navigator.pushNamed(
                        context,
                        'user/userViewPage',
                        // arguments: {'exampleArgument': exampleArgument},
                      );
                    },
                    child: Card(
                      // color: Colors.grey[600],
                      // color: Color.fromARGB(255, 97, 165, 172),
                      color: Color.fromARGB(255, 76, 164, 174),
                      child: ListTile(
                        textColor: Colors.white,
                        leading: Image.asset(
                          "lib/assets/images/User.png",
                          width: 40.0,
                          height: 40.0,
                        ),
                        title: Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                        subtitle: Text(
                          'usertype',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          // color: Colors.black,
                          iconSize: 33,
                          color: Colors.red[500],
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),

                  // ListTile(
                  //   textColor: Color.fromARGB(255, 23, 22, 17),
                  //   title: Text("List item $index"),
                  //   subtitle: Text("hello"),
                  //   leading: const Icon(Icons.library_books_outlined),
                  //   trailing: IconButton(
                  //     icon: Icon(Icons.arrow_forward_ios_outlined),
                  //     // color: Colors.black,
                  //     iconSize: 30,
                  //     onPressed: () {},
                  //   ),
                  // ),
                );
              }),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => UseraddPage(),
              // ));

              Navigator.pushNamed(
                context,
                'user/Addpage',
                // arguments: {'exampleArgument': exampleArgument},
              );
            },
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
