import 'package:araz_mobile_application/Model/School.dart';
import 'package:araz_mobile_application/Repository/SchoolRepository.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:araz_mobile_application/Widgets/custom_AlertDialogbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class PreschoolListView extends StatefulWidget {
  const PreschoolListView({super.key});

  @override
  State<PreschoolListView> createState() => _PreschoolListViewState();
}

class _PreschoolListViewState extends State<PreschoolListView> {
  late Stream<List<School>> School_list;
  var RecipeRepo = SchoolRepository();

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
                                '/Announcements/AnnouncementslistPage',
                                arguments: snapshot.data![index],
                              );
                            },
                            child: Card(
                              color: Color.fromARGB(255, 76, 164, 174),
                              child: ListTile(
                                textColor: Colors.white,
                                title: Flexible(
                                  fit: FlexFit.loose,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Preschool Name:  ${snapshot.data![index].name}' +
                                                  " ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
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
      ]),
    );
  }
}
