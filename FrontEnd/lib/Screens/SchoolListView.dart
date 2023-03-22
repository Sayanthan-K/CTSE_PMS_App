import 'package:araz_mobile_application/Model/School.dart';
import 'package:araz_mobile_application/Repository/SchoolRepository.dart';
import 'package:araz_mobile_application/Screens/SchoolViewPage.dart';
import 'package:araz_mobile_application/Screens/SchoolAddPage.dart';
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
    super.initState();
    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    final customheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(context, "ALL School"),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.all(10),
          height: customheight * 0.90,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder(
              stream: School_list,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.isEmpty) {
                    // check school data is empty or not
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
                                              '${snapshot.data![index].name}' +
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
                                  iconSize: 33,
                                  color: Colors.red[500],
                                  onPressed: () {
                                    setState(() {
                                      showDialog(
                                          // alert dialog box when delete school
                                          context: context,
                                          builder: (context) =>
                                              custom_AlertDialogbox(
                                                  bodymessgae:
                                                      "Do you want delete School",
                                                  title: "Comformation",
                                                  leftbuttontext: "Cancel",
                                                  leftOnTap: (() {
                                                    Navigator.of(context).pop();
                                                  }),
                                                  Righttbuttontext: "Yes",
                                                  RightOnTap: (() {
                                                    deleteSchool(
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
          //add school button implementation
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () {
              // navigate to add school page

              Navigator.pushNamed(
                context,
                'school/Addpage',
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
