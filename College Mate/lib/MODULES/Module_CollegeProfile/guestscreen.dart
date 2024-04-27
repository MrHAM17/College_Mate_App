import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Module_CollegeProfile/college_about_page.dart';
import 'package:mech_it/MODULES/Module_CollegeProfile/college_about_page.dart';

import 'college_campus_page.dart';
import 'college_contact_page.dart';
import 'college_courses_page.dart';
import 'college_events_page.dart';
import 'college_gallary_page.dart';
import 'college_support_page.dart';
import 'college_admin_page.dart';

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? selectedCollege;

  @override
  void initState() {
    super.initState();
    _getDataFromSharedPreferences();
  }

  _getDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCollege = prefs.getString('selectedCollege');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check if any of the required data is null
    if (selectedCollege == null ) {
      // Return a loading or error widget or a CircularProgressIndicator
      return Center(child: CircularProgressIndicator());
    }

    return MaterialApp(
      title: 'College App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

    // prefs.setString('selectedBranch', studentBranch!);
    // prefs.setString('selectedCategory', userDocs.docs.first.id);  // Store the document ID

      home: GuestScreen(selectedCollege: selectedCollege!),
    );
  }
}


class GuestScreen extends StatelessWidget {

  final String selectedCollege;
  GuestScreen({required this.selectedCollege});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Adjust the height as needed
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                    "\nTPCT's TEC College Mgt App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),


      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(35,10, 35, 2),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/guest_bg.jg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing:20,
          mainAxisSpacing:20,
          children: <Widget>[
            CustomButton(
              text: 'About',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
            ),
            CustomButton(
              text: 'Admin',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateScreen()),
                );
              },
            ),
            CustomButton(
              text: 'Events',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventsPage(selectedCollege: selectedCollege!)),
                );

              },
            ),
            CustomButton(
              text: 'Gallery',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GallaryPage(selectedCollege: selectedCollege!,
                    studentBranch: 'Guest Screen',  studentId: 'Guest Mode',
                    )),    // GalleryScreen
                );
              },
            ),

            CustomButton(
              text: 'Courses',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoursesScreen()),
                );              },
            ),
            CustomButton(
              text: 'Campus',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CampusScreen()),
                );              },
            ),
            CustomButton(
              text: 'Contact',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactScreen()),
                );              },
            ),
            CustomButton(
              text: 'Support',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SupportScreen()),
                );              },
            ),
          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
