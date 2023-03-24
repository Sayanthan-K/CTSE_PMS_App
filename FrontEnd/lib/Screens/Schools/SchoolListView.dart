import 'package:araz_mobile_application/Model/School.dart';
import 'package:araz_mobile_application/Repository/SchoolRepository.dart';
import 'package:araz_mobile_application/Screens/Schools/SchoolViewPage.dart';
import 'package:araz_mobile_application/Screens/Schools/SchoolAddPage.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:araz_mobile_application/Widgets/custom_AlertDialogbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class SchoolListView extends StatefulWidget {
  const SchoolListView({super.key});

  @override
  State<SchoolListView> createState() => _SchoolListViewState();
}

class _SchoolListViewState extends State<SchoolListView> {
  late Stream<List<School>> School_list;
  late List<School> serach_list;
  TextEditingController _searchController = TextEditingController();
  String searchText = '';
  var RecipeRepo = SchoolRepository();
  void deleteSchool(School id) {
    setState(() {
      RecipeRepo.deleteSchool(id);
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
    School_list = RecipeRepo.AllSchools();
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
      appBar: CustomAppBar(context, "ALL School views"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(10),
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
          Container(
            padding: EdgeInsets.all(10),
            height: customheight * 0.70,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder(
                stream: School_list,
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

                    return ListView.builder(
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
                                  'school/schoolViewPage',
                                  arguments: snapshot.data[index],
                                );
                              },
                              child: Card(
                                color: Color.fromARGB(255, 76, 164, 174),
                                child: ListTile(
                                  textColor: Colors.white,
                                  leading: Image.asset(
                                    "lib/assets/images/School.png",
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
                                                '${serach_list![index].name}' +
                                                    " ",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
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
                                                        "Do you want delete School",
                                                    title: "Comformation",
                                                    leftbuttontext: "Cancel",
                                                    leftOnTap: (() {
                                                      Navigator.of(context)
                                                          .pop();
                                                    }),
                                                    Righttbuttontext: "Yes",
                                                    RightOnTap: (() {
                                                      deleteSchool(snapshot
                                                          .data![index]);
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
            // margin: EdgeInsets.all(20),
            // padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => SchooladdPage(),
                // ));

                Navigator.pushNamed(
                  context,
                  'school/Addpage',
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
      ),
    );
  }
}
