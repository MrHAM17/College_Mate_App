

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mech_it/UTILS/constants/colors.dart';
import 'package:mech_it/UTILS/imageview/imageViewer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'apply_cp_opp_page.dart';
import 'show_applied_cp_opp_tab.dart';
import 'show_updates_tab.dart';
import 'show_toolkit_tab.dart';
import 'package:intl/intl.dart';


class CampusPlacementScreen extends StatefulWidget {
  final String? selectedCollege;
  final String? studentBranch;
  final String? studentId;

  CampusPlacementScreen({
    Key? key,
    this.selectedCollege,
    this.studentId,
    this.studentBranch,
  }) : super(key: key);

  @override
  _CampusPlacementScreenState createState() => _CampusPlacementScreenState();
}

class _CampusPlacementScreenState extends State<CampusPlacementScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // late String selectedCategory;
  // late String selectedBranch;

  // String? selectedCollege;
  // String? studentBranch;
  // String? studentId;  // Define studentId here

  // _getSelectedCollege() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     selectedCollege = prefs.getString('selectedCollege');
  //     // print('Selected College: $selectedCollege');  // Debugging print
  //   });
  // }
  //
  // _getStudentBranch() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     studentBranch = prefs.getString('studentBranch');  // Assuming 'studentBranch' is stored as a string in SharedPreferences
  //   });
  // }
  //
  // _getStudentId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     studentId = prefs.getString('studentId');  // Assuming 'studentId' is stored as a string in SharedPreferences
  //   });
  // }


  @override
  void initState() {
    super.initState();
    // _getSelectedCollege();
    // _getStudentBranch();
    // _getStudentId();  // Fetch studentId
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(122),
        child: Container(
          decoration: BoxDecoration(
            gradient: customLinearGradient(),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            elevation: 10,
            backgroundColor: Colors.transparent,
            title: Text(
              'Campus Placement',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            centerTitle: true,
            bottom: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: 'Updates'),
                Tab(text: 'My App.'),
                Tab(text: 'My Toolkit'),
              ],
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildTabView('Updates'),
            _buildTabView('My App.'),
            _buildTabView('My Toolkit'),
          ],
        ),
      ),
    );
  }

  Widget _buildTabView(String tabName) {
    switch (tabName) {
      case 'Updates':
        return ShowUpdatesTab(selectedCollege: widget.selectedCollege!,  studentBranch: widget.studentBranch!, studentId: widget.studentId! );
      case 'My App.':
        return ShowAppliedCpOppTab(selectedCollege: widget.selectedCollege!, studentBranch: widget.studentBranch!, studentId: widget.studentId! );
      case 'My Toolkit':
        print('Building My Toolkit Tab');  // Debugging print
        return ShowToolkitTab(selectedCollege: widget.selectedCollege!,  studentBranch: widget.studentBranch!, studentId: widget.studentId! );
      default:
        return Center(child: Text('Invalid Tab'));
    }
  }

  LinearGradient customLinearGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: [
        Color(0xff43cea2),
        Color(0xff185a9d),
      ],
    );
  }
}