import 'package:flutter/material.dart';
import 'package:mech_it/SECTIONS/USER_Admin/Work/view_EA_post_response.dart';
import 'package:mech_it/SECTIONS/USER_Admin/Work/view_CP_post_response.dart';
import 'package:mech_it/SECTIONS/USER_Admin/Work/upload_post.dart';

import 'manage_post.dart';

class CollegeAdminHomeScreen extends StatelessWidget {
  final String? selectedCollege;
  final String? selectedBranch;
  final String? selectedRole;

  CollegeAdminHomeScreen(this.selectedCollege, this.selectedBranch, this.selectedRole);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Home',
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
                      MaterialPageRoute(builder: (context) => PostUploadPage()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Upload Post', style: TextStyle(fontSize: 18)),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ManagePostPage(
                          selectedCollege: selectedCollege!,
                          selectedBranch: selectedBranch!,
                          selectedRole: selectedRole!,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Manage Post', style: TextStyle(fontSize: 18)),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ViewCPPostResponsePage(
                    //
                    //     // selectedCollege: selectedCollege!,
                    //     // selectedBranch: selectedBranch!,
                    //     // selectedRole: selectedRole!,
                    //   )),
                    // );
                    if (selectedRole == 'TRAINING & PLACEMENT') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewCPPostResponsePage(
                            selectedCollege: selectedCollege!, selectedBranch: selectedBranch!,
                            // selectedRole: '',
                          ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewEAPostResponsePage(),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('View Response', style: TextStyle(fontSize: 18)),
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
                        Text('Admin Settings', style: TextStyle(fontSize: 18)),
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
