import 'package:flutter/material.dart';

import 'package:mech_it/MODULES/Module_N&E/campus_fusion_screen.dart';
import 'package:mech_it/MODULES/Module_T&P/campus_placement_screen.dart';
import 'package:mech_it/SECTIONS/Home/dashboard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCollege;
  String? studentId;
  String? studentBranch;


  @override
  void initState() {
    super.initState();
    _getDataFromSharedPreferences();
  }

  _getDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCollege = prefs.getString('selectedCollege');
      studentBranch = prefs.getString('studentBranch');
      studentId = prefs.getString('studentId');
    });
  }

  // selectedCollege: selectedCollege!,  studentBranch: studentBranch!, studentId: studentId!


  Color ternaBlue = Color(0xff43cea2);
  Color pink1 = Color(0xff185a9d);

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    // Check if any of the required data is null
    if (selectedCollege == null || studentBranch == null || studentId == null) {
      // Return a loading or error widget or a CircularProgressIndicator
      return Center(child: CircularProgressIndicator());
    }

    List<Widget> _screens = <Widget>[
      CampusFusionScreen(selectedCollege: selectedCollege!,
          studentBranch: studentBranch!, studentId: studentId!
      ),
      Dashboard(selectedCollege: selectedCollege!,  studentBranch: studentBranch!, studentId: studentId!),
      CampusPlacementScreen(selectedCollege: selectedCollege!,  studentBranch: studentBranch!, studentId: studentId!),
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
