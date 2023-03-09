import 'package:araz_mobile_application/Screens/Navigations.dart';
import 'package:araz_mobile_application/Widgets/CustomAppBar.dart';
import 'package:araz_mobile_application/Widgets/Topnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "Pre-school Admin panel"),
      drawer: Topnavigationbar(context, _drawerIconSize, _drawerFontSize),
      body: Navigations(),
    );
  }
}
