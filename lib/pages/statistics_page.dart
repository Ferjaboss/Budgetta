import 'package:flutter/material.dart';

import '../widgets/bottom_nav_menu.dart';


class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Statistics' ,style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'sf-display',)),
      centerTitle: true,
      automaticallyImplyLeading: false,
    ),
    body: Center(
    child: Text('Statistics Page'),
    ),
    bottomNavigationBar: BottomNavMenu(initialIndex:
    1
    )
    ,
    );
  }
}