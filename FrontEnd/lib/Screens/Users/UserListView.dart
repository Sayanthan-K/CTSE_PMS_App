import 'package:araz_mobile_application/Helper/theme_helper.dart';
import 'package:araz_mobile_application/Model/User.dart';
import 'package:araz_mobile_application/Repository/UserRepository.dart';
import 'package:araz_mobile_application/Screens/Users/UserViewPage.dart';
import 'package:araz_mobile_application/Screens/Users/useraddpage.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:araz_mobile_application/Widgets/custom_AlertDialogbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  late User user;
  var totalStudent;
  var totalParents;
  var totalTeacher;
  late List count_all;
  late Stream<List<User>> User_list;
  late List<User> serach_list;

  var buttondetails = [];
  var data = [];
  var UsersRepo = UserRepository();
  void deleteUser(User id) {
    setState(() {
      UsersRepo.deleteUser(id);
      Navigator.of(context).pop();
      MotionToast.delete(
        title: const Text(
          'Successfully Deleted',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        description: const Text('The user is deleted'),
        animationType: AnimationType.fromTop,
        position: MotionToastPosition.top,
      ).show(context);
    });
  }

  TextEditingController _searchController = TextEditingController();
  String searchText = '';

  void loaddata() {
    User_list = UsersRepo.AllUsers();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    final customheight = MediaQuery.of(context).size.height;
    final customweight = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(context, "ALL User views"),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          Container(
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
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
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 0, 202, 248)),
                ),
                // enabledBorder: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(0),
              height: customheight * 0.90,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                  stream: User_list,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.isEmpty) {
                        return Center(
                          child: Text(
                            "No data found",
                            style: TextStyle(
                              fontFamily: 'Opensan',
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        );
                      }

                      serach_list = snapshot.data;

                      if (searchText.length > 0) {
                        serach_list = serach_list.where((element) {
                          return element
                              .toString()
                              .toLowerCase()
                              .contains(searchText.toLowerCase());
                        }).toList();
                      }

                      return Column(children: [
                        Container(
                          width: customweight,
                          height: customheight * 0.06,
                          child: (serach_list != null)
                              ? Card(
                                  color: Color.fromARGB(255, 76, 164, 174),
                                  child: Text(
                                    'Total Users  ${serach_list.length}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              : Card(
                                  color: Color.fromARGB(255, 76, 164, 174),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )),
                        ),
                        Expanded(
                          child: ListView.builder(
                              // itemCount: snapshot.data!.length,
                              itemCount: serach_list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.all(3),
                                  margin: EdgeInsets.all(3),
                                  height: customheight * 0.12,
                                  width: MediaQuery.of(context).size.width,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        'user/userViewPage',
                                        arguments: serach_list[index],
                                      );
                                    },
                                    child: Card(
                                      color: Color.fromARGB(255, 28, 174, 169),
                                      child: ListTile(
                                        textColor: Colors.white,
                                        // leading:
                                        // Image.asset(
                                        //   "lib/assets/images/User.png",
                                        //   width: 45.0,
                                        //   height: 45.0,
                                        // ),
                                        leading: CircleAvatar(
                                          radius: 32,
                                          child: Image.asset(
                                            fit: BoxFit.cover,
                                            "lib/assets/images/User.png",
                                            width: 45.0,
                                            height: 45.0,
                                          ),
                                          backgroundColor: Colors.white,
                                        ),
                                        title: Flexible(
                                          fit: FlexFit.loose,
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '${serach_list[index].first_Name}' +
                                                          " ",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                TextSpan(
                                                  text:
                                                      '${serach_list[index].last_Name}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        subtitle: Text(
                                          snapshot.data![index].usertype,
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
                                          color: Colors.red[600],
                                          onPressed: () {
                                            setState(() {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      custom_AlertDialogbox(
                                                          bodymessgae:
                                                              "Do you want delete User",
                                                          title: "Comformation",
                                                          leftbuttontext:
                                                              "Cancel",
                                                          leftOnTap: (() {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          }),
                                                          Righttbuttontext:
                                                              "Yes",
                                                          RightOnTap: (() {
                                                            deleteUser(snapshot
                                                                .data![index]);
                                                          })));
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ]);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Center(
                      child: const CircularProgressIndicator(),
                    );
                  }),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'user/Addpage',
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                elevation: 0,
                backgroundColor: Color.fromARGB(255, 76, 164, 174),
              ),
              // tooltip: "add list item",
              child: Text(
                "+ Add User",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
