import 'package:araz_mobile_application/Model/User.dart';
import 'package:araz_mobile_application/Repository/UserRepository.dart';
import 'package:araz_mobile_application/Screens/UserViewPage.dart';
import 'package:araz_mobile_application/Screens/useraddpage.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:araz_mobile_application/Widgets/custom_AlertDialogbox.dart';
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
  late Stream<List<User>> User_list;
  var RecipeRepo = UserRepository();
  void deleteUser(User id) {
    setState(() {
      RecipeRepo.deleteUser(id);
      Navigator.of(context).pop();
      MotionToast.delete(
        title: const Text(
          'Successfully Deleted',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        description: const Text('The item is deleted'),
        animationType: AnimationType.fromTop,
        position: MotionToastPosition.top,
      ).show(context);
    });
  }

  void loaddata() {
    User_list = RecipeRepo.AllUsers();
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
    return Scaffold(
      appBar: CustomAppBar(context, "ALL User views"),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.all(10),
          height: customheight * 0.90,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder(
              stream: User_list,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                  print(snapshot.hasData);

                  return ListView.builder(
                      itemCount: snapshot.data!.length,
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
                                arguments: snapshot.data[index],
                              );
                            },
                            child: Card(
                              color: Color.fromARGB(255, 76, 164, 174),
                              child: ListTile(
                                textColor: Colors.white,
                                leading: Image.asset(
                                  "lib/assets/images/User.png",
                                  width: 40.0,
                                  height: 40.0,
                                ),
                                title: Flexible(
                                  fit: FlexFit.loose,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              '${snapshot.data![index].first_Name}' +
                                                  " ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              '${snapshot.data![index].last_Name}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
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
                                  color: Colors.red[500],
                                  onPressed: () {
                                    setState(() {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              custom_AlertDialogbox(
                                                  bodymessgae:
                                                      "Do you want delete User",
                                                  title: "Comformation",
                                                  leftbuttontext: "Cancel",
                                                  leftOnTap: (() {
                                                    Navigator.of(context).pop();
                                                  }),
                                                  Righttbuttontext: "Yes",
                                                  RightOnTap: (() {
                                                    deleteUser(
                                                        snapshot.data![index]);
                                                  })));
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(
                  child: const CircularProgressIndicator(),
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
