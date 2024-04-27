import 'package:flutter/material.dart';

import '../../SECTIONS/USER_Admin/Login/login.dart';
import '../../SECTIONS/USER_Admin/Login/signup.dart';

class UpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff43cea2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        toolbarHeight: 80.0, // Set the height of the AppBar
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding from left & right
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminLoginScreen()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Admin Login', style: TextStyle(fontSize: 18)),
                        Icon(Icons.login),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminSignupScreen()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Admin Signup', style: TextStyle(fontSize: 18)),
                        Icon(Icons.person_add),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    // Navigate to ManageScreen or equivalent
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Manage', style: TextStyle(fontSize: 18)),
                        Icon(Icons.build),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () {
                    // Navigate to SettingsScreen or equivalent
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Settings', style: TextStyle(fontSize: 18)),
                        Icon(Icons.settings),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
