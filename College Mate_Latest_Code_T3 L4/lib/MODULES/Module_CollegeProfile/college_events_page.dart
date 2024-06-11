

import 'package:flutter/material.dart';
import 'package:mech_it/UTILS/constants/colors.dart';
import 'package:mech_it/UTILS/imageview/imageViewer.dart';

import '../Module_N&E/campus_fusion_screen.dart';

class EventsPage extends StatefulWidget {
  final String selectedCollege;
  EventsPage({required this.selectedCollege});

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: CampusFusionScreen(selectedCollege: widget.selectedCollege,
        studentBranch: 'Guest Screen',  studentId: 'Guest Mode',
      ),
      // home: OnboardingScreen(),

    );
  }
}
