import 'package:flutter/material.dart';

import 'package:mech_it/MODULES/Module_N&E/campus_fusion_screen.dart';
import 'package:mech_it/MODULES/Module_T&P/campus_placement_screen.dart';
import 'package:mech_it/SECTIONS/Home/dashboard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color ternaBlue = Color(0xff43cea2);
  Color pink1 = Color(0xff185a9d);

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = <Widget>[
      CampusFusionScreen(role: ''),
      Dashboard(role: ''),
      CampusPlacementScreen(role: ''),
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: ternaBlue,
        buttonBackgroundColor: pink1,
        height: 50,
        animationDuration: Duration(milliseconds: 200),
        index: _selectedIndex,
        items: <Widget>[
          Icon(Icons.pages_rounded, size: 28, color: Colors.white),
          Icon(Icons.home, size: 28, color: Colors.white),
          Icon(Icons.dashboard, size:28, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
