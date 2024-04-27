

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mech_it/UTILS/constants/colors.dart';
import 'package:mech_it/UTILS/imageview/imageViewer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CampusFusionScreen extends StatefulWidget {
  String role;
  CampusFusionScreen({Key? key, required this.role}) : super(key: key);


  List<String> category = [
    'All',
    'ANTRANG',
    'AVALON',
    'NSS',
    'REVIVE',
    'RESONANCE',
    'SPORTEC',
    'Events',
    'Fests',
    'IMP',
    'Training & Placements',
  ];

  List<String> branch = [
    'All',
    'AIDS',
    'Civil',
    'Computer',
    'EXTC',
    'IT',
    'Mechanic',
    'Mechatronics',
  ];

  List<String> years = ['2021', '2022', '2023', '2024'];

  @override
  _CampusFusionScreenState createState() => _CampusFusionScreenState();
}

class _CampusFusionScreenState extends State<CampusFusionScreen> {
  late String selectedCategory;
  late String selectedBranch;
  late String selectedYear;

  late TabController _tabController;
  String? selectedCollege;

  _getSelectedCollege() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCollege = prefs.getString('selectedCollege');
    });
  }

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category.first;
    selectedBranch = widget.branch.first;
    selectedYear = widget.years.first;

    _getSelectedCollege();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Custom Card
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: customLinearGradient(),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
              padding: EdgeInsets.all(26),
              child: Column(
                children: [
                  Text(
                    "Campus Fusion",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          _showCategorySelectionDialog();
                        },
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        label: Text('$selectedCategory'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.fromLTRB(3,10,4,10),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _showBranchSelectionDialog();
                        },
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        label: Text('$selectedBranch'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.fromLTRB(3,10,4,10),

                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _showYearSelectionDialog();
                        },
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        label: Text('$selectedYear'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.fromLTRB(3,10,4,10),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // _prepareView();
                        },
                        child: Icon(Icons.check, color: Colors.black),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.white,
                          padding: EdgeInsets.fromLTRB(3,10,4,10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height:1),
            // Placeholder for fetching data from Firebase

          ],
        ),
      ),
    );
  }

  _showCategorySelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Category'),
          content: SingleChildScrollView(
            child: ListBody(
              children: widget.category.map((category) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  _showBranchSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Branch'),
          content: SingleChildScrollView(
            child: ListBody(
              children: widget.branch.map((branch) {
                return ListTile(
                  title: Text(branch),
                  onTap: () {
                    setState(() {
                      selectedBranch = branch;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  _showYearSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Year'),
          content: SingleChildScrollView(
            child: ListBody(
              children: widget.years.map((year) {
                return ListTile(
                  title: Text(year),
                  onTap: () {
                    setState(() {
                      selectedYear = year;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }


  // Widget _prepareView() {
  //   String tabName = selectedCategory; // Use selectedCategory as the tabName
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: FirebaseFirestore.instance
  //         .collection('College Mate')
  //         .doc('Institution')
  //         .collection('Colleges')
  //         .doc(selectedCollege) // Make sure to define selectedCollege
  //         .collection('DATA')
  //         .where('category', isEqualTo: tabName)
  //         .snapshots(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return Center(child: Text('Error: ${snapshot.error}'));
  //       }
  //
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       }
  //
  //       List<DocumentSnapshot> documents = snapshot.data!.docs;
  //
  //       return _displayView(documents);
  //     },
  //   );
  // }


  // Widget _displayView(List<DocumentSnapshot> documents) {
  //   return ListView.builder(
  //     itemCount: documents.length,
  //     itemBuilder: (context, index) {
  //       var data = documents[index].data() as Map<String, dynamic>?;
  //
  //       var description = data?['description'] ?? 'No description';
  //       var fileUrl = data?['fileUrl'] as String?;
  //       var adminName = data?['Name'] ?? 'Unknown';
  //
  //       return Card(
  //         margin: EdgeInsets.symmetric(vertical: 8),
  //         child: ListTile(
  //           title: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(description),
  //               SizedBox(height: 8),
  //               Text('Posted By: $adminName'),
  //             ],
  //           ),
  //           subtitle: fileUrl != null ? Container(width: 200, height: 300, child: Image.network(fileUrl)) : null,
  //           onTap: () {
  //             // Navigate to update details page or display update
  //             if (fileUrl != null) {
  //               // Open file or show file details
  //             } else {
  //               // Navigate or display text details
  //             }
  //           },
  //         ),
  //       );
  //     },
  //     padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
  //   );
  // }



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
