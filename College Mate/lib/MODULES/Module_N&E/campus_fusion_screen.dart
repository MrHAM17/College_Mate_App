/////////////////////        1        ////////////////////////////////////////////////



// import 'package:flutter/material.dart';
// import 'package:mech_it/UTILS/constants/colors.dart';
// import 'package:mech_it/UTILS/imageview/imageViewer.dart';
//
// class CampusFusionScreen extends StatefulWidget {
//   String role;
//   CampusFusionScreen({Key? key, required this.role}) : super(key: key);
//
//   List<String> title = <String>[
//     "Exam Notice",
//     "DSE SEM III Exam Timetable",
//     "Updated fees for FE & DSE",
//     "Student Council 2021-22",
//     "Ph.D. Admission 2021-2022"
//   ];
//
//   List<String> date = <String>[
//     '28.01.2022',
//     '24.01.2022',
//     '27.12.2021',
//     '24.01.2022',
//     '15.12.2021'
//   ];
//
//   List<String> image = <String>[
//     'assets/noticeImages/notice1.jpg',
//     'assets/noticeImages/notice2.jpg',
//     'assets/noticeImages/notice3.jpg',
//     'assets/noticeImages/notice4.jpg',
//     'assets/noticeImages/notice5.jpg'
//   ];
//
//   List<String> eventsAndActivities = [
//     'All',
//     'ATRANG',
//     'Events',
//     'Fests',
//     'NSS',
//     'REVIVE',
//     'RESONANCE',
//
//     'AIDS',
//     'Civil',
//     'Computer',
//     'EXTC',
//     'IT',
//     'Mechanic',
//     'Mechatronics',
//   ];
//
//   List<String> years = ['2021', '2022', '2023', '2024'];
//
//   @override
//   _CampusFusionScreenState createState() => _CampusFusionScreenState();
// }
//
// class _CampusFusionScreenState extends State<CampusFusionScreen> {
//   late String selectedEvent;
//   late String selectedYear;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedEvent = widget.eventsAndActivities.first;
//     selectedYear = widget.years.first;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         primary: false,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Custom Card
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 gradient: customLinearGradient(),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
//               padding: EdgeInsets.all(26),
//               child: Column(
//                 children: [
//                   Text(
//                     "Campus Fusion",
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                   SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton.icon(
//                         onPressed: () {
//                           _showEventSelectionDialog();
//                         },
//                         icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                         label: Text('$selectedEvent'),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.white,
//                           padding: EdgeInsets.all(10),
//
//                         ),
//                       ),
//                       ElevatedButton.icon(
//                         onPressed: () {
//                           _showYearSelectionDialog();
//                         },
//                         icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                         label: Text('$selectedYear'),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.white,
//                           padding: EdgeInsets.all(10),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                         },
//                         child: Icon(Icons.check, color: Colors.black),
//                         style: ElevatedButton.styleFrom(
//                           shape: CircleBorder(),
//                           primary: Colors.white,
//                           padding: EdgeInsets.all(10),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height:1),
//             // Placeholder for fetching data from Firebase
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: widget.title.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(widget.title[index]),
//                   subtitle: Text(widget.date[index]),
//                   onTap: () {
//                     _showNoticeDetails(index);
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _showEventSelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Event'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: widget.eventsAndActivities.map((event) {
//                 return ListTile(
//                   title: Text(event),
//                   onTap: () {
//                     setState(() {
//                       selectedEvent = event;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   _showYearSelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Year'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: widget.years.map((year) {
//                 return ListTile(
//                   title: Text(year),
//                   onTap: () {
//                     setState(() {
//                       selectedYear = year;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   _showNoticeDetails(int index) {
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (context) => ImageViewer(
//     //       imgpath: widget.image[index],
//     //     ),
//     //   ),
//     // );
//   }
//
//   LinearGradient customLinearGradient() {
//     return const LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.topRight,
//       colors: [
//         Color(0xff43cea2),
//         Color(0xff185a9d),
//       ],
//     );
//   }
// }
//








/////////////////////        2        ////////////////////////////////////////////////          simple view


//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:mech_it/UTILS/constants/colors.dart';
// import 'package:mech_it/UTILS/imageview/imageViewer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CampusFusionScreen extends StatefulWidget {
//   String role;
//   CampusFusionScreen({Key? key, required this.role}) : super(key: key);
//
//
//   List<String> category = [
//     'All',
//     'ANTRANG',
//     'AVALON',
//     'NSS',
//     'REVIVE',
//     'RESONANCE',
//     'SPORTEC',
//     'EVENTS',
//     'FESTS',
//     'IMP',
//     'TRAINING & PLACEMENT',
//   ];
//
//   List<String> branch = [
//     'All',
//     'AIDS',
//     'Civil',
//     'Computer',
//     'EXTC',
//     'IT',
//     'Mechanic',
//     'Mechatronics',
//   ];
//
//   List<String> years = ['2021', '2022', '2023', '2024'];
//
//   @override
//   _CampusFusionScreenState createState() => _CampusFusionScreenState();
// }
//
// class _CampusFusionScreenState extends State<CampusFusionScreen> {
//   late String selectedCategory;
//   late String selectedBranch;
//   late String selectedYear;
//
//   late TabController _tabController;
//   String? selectedCollege;
//   String? studentId;  // Define studentId here
//
//   _getSelectedCollege() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       selectedCollege = prefs.getString('selectedCollege');
//     });
//   }
//
//   _getStudentId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       studentId = prefs.getString('studentId');  // Assuming 'studentId' is stored as a string in SharedPreferences
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     selectedCategory = widget.category.first;
//     selectedBranch = widget.branch.first;
//     selectedYear = widget.years.first;
//
//     _getSelectedCollege();
//     _getStudentId();  // Fetch studentId
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         primary: false,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Custom Card
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 gradient: customLinearGradient(),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
//               padding: EdgeInsets.all(26),
//               child: Column(
//                 children: [
//                   Text(
//                     "Campus Fusion",
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                   SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton.icon(
//                         onPressed: () {
//                           _showCategorySelectionDialog();
//                         },
//                         icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                         label: Text('$selectedCategory'),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.white,
//                           padding: EdgeInsets.fromLTRB(3,10,4,10),
//                         ),
//                       ),
//                       ElevatedButton.icon(
//                         onPressed: () {
//                           _showBranchSelectionDialog();
//                         },
//                         icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                         label: Text('$selectedBranch'),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.white,
//                           padding: EdgeInsets.fromLTRB(3,10,4,10),
//
//                         ),
//                       ),
//                       ElevatedButton.icon(
//                         onPressed: () {
//                           _showYearSelectionDialog();
//                         },
//                         icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                         label: Text('$selectedYear'),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.white,
//                           padding: EdgeInsets.fromLTRB(3,10,4,10),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // _prepareView();
//                         },
//                         child: Icon(Icons.check, color: Colors.black),
//                         style: ElevatedButton.styleFrom(
//                           shape: CircleBorder(),
//                           primary: Colors.white,
//                           padding: EdgeInsets.fromLTRB(3,10,4,10),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height:1),
//             // Placeholder for fetching data from Firebase
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   _showCategorySelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Category'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: widget.category.map((category) {
//                 return ListTile(
//                   onTap: () {
//                     setState(() {
//                       selectedCategory = category;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   _showBranchSelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Branch'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: widget.branch.map((branch) {
//                 return ListTile(
//                   title: Text(branch),
//                   onTap: () {
//                     setState(() {
//                       selectedBranch = branch;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   _showYearSelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Year'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: widget.years.map((year) {
//                 return ListTile(
//                   title: Text(year),
//                   onTap: () {
//                     setState(() {
//                       selectedYear = year;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//
//   // Widget _prepareView() {
//   //   String tabName = selectedCategory; // Use selectedCategory as the tabName
//   //   return StreamBuilder<QuerySnapshot>(
//   //     stream: FirebaseFirestore.instance
//   //         .collection('College Mate')
//   //         .doc('Institution')
//   //         .collection('Colleges')
//   //         .doc(selectedCollege) // Make sure to define selectedCollege
//   //         .collection('DATA')
//   //         .where('category', isEqualTo: tabName)
//   //         .snapshots(),
//   //     builder: (context, snapshot) {
//   //       if (snapshot.hasError) {
//   //         return Center(child: Text('Error: ${snapshot.error}'));
//   //       }
//   //
//   //       if (snapshot.connectionState == ConnectionState.waiting) {
//   //         return Center(child: CircularProgressIndicator());
//   //       }
//   //
//   //       List<DocumentSnapshot> documents = snapshot.data!.docs;
//   //
//   //       return _displayView(documents);
//   //     },
//   //   );
//   // }
//
//
//   // Widget _displayView(List<DocumentSnapshot> documents) {
//   //   return ListView.builder(
//   //     itemCount: documents.length,
//   //     itemBuilder: (context, index) {
//   //       var data = documents[index].data() as Map<String, dynamic>?;
//   //
//   //       var description = data?['description'] ?? 'No description';
//   //       var fileUrl = data?['fileUrl'] as String?;
//   //       var adminName = data?['Name'] ?? 'Unknown';
//   //
//   //       return Card(
//   //         margin: EdgeInsets.symmetric(vertical: 8),
//   //         child: ListTile(
//   //           title: Column(
//   //             crossAxisAlignment: CrossAxisAlignment.start,
//   //             children: [
//   //               Text(description),
//   //               SizedBox(height: 8),
//   //               Text('Posted By: $adminName'),
//   //             ],
//   //           ),
//   //           subtitle: fileUrl != null ? Container(width: 200, height: 300, child: Image.network(fileUrl)) : null,
//   //           onTap: () {
//   //             // Navigate to update details page or display update
//   //             if (fileUrl != null) {
//   //               // Open file or show file details
//   //             } else {
//   //               // Navigate or display text details
//   //             }
//   //           },
//   //         ),
//   //       );
//   //     },
//   //     padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
//   //   );
//   // }
//
//
//
//   LinearGradient customLinearGradient() {
//     return const LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.topRight,
//       colors: [
//         Color(0xff43cea2),
//         Color(0xff185a9d),
//       ],
//     );
//   }
// }










/////////////////////        3       ////////////////////////////////////////////////   try using previous code



//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mech_it/UTILS/constants/colors.dart';
// import 'package:mech_it/UTILS/imageview/imageViewer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CampusFusionScreen extends StatefulWidget {
//   String role;
//   CampusFusionScreen({Key? key, required this.role}) : super(key: key);
//
//
//   List<String> category = [
//     'All',
//     'ANTRANG',
//     'AVALON',
//     'NSS',
//     'REVIVE',
//     'RESONANCE',
//     'SPORTEC',
//     'EVENTS',
//     'FESTS',
//     'IMP',
//     'TRAINING & PLACEMENT',
//   ];
//
//   List<String> branch = [
//     'All',
//     'AIDS',
//     'Civil',
//     'Computer',
//     'EXTC',
//     'IT',
//     'Mechanic',
//     'Mechatronics',
//   ];
//
//   List<String> years = ['2021', '2022', '2023', '2024'];
//
//   @override
//   _CampusFusionScreenState createState() => _CampusFusionScreenState();
// }
//
// class _CampusFusionScreenState extends State<CampusFusionScreen> {
//   late String selectedCategory;
//   late String selectedBranch;
//   late String selectedYear;
//
//   late TabController _tabController;
//   String? selectedCollege;
//   String? studentId;  // Define studentId here
//
//   _getSelectedCollege() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       selectedCollege = prefs.getString('selectedCollege');
//     });
//   }
//
//   _getStudentId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       studentId = prefs.getString('studentId');  // Assuming 'studentId' is stored as a string in SharedPreferences
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     selectedCategory = widget.category.first;
//     selectedBranch = widget.branch.first;
//     selectedYear = widget.years.first;
//
//     _getSelectedCollege();
//     _getStudentId();  // Fetch studentId
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         primary: false,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Custom Card
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 gradient: customLinearGradient(),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
//               padding: EdgeInsets.all(26),
//               child: Column(
//                 children: [
//                   Text(
//                     "Campus Fusion",
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                   SizedBox(height: 15),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         ElevatedButton.icon(
//                           onPressed: () {
//                             _showCategorySelectionDialog();
//                           },
//                           icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                           label: Text('$selectedCategory'),
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.white,
//                             padding: EdgeInsets.fromLTRB(0,10,4,10),
//                           ),
//                         ),
//                         SizedBox(width: 10), // Add SizedBox for spacing between buttons
//                         ElevatedButton.icon(
//                           onPressed: () {
//                             _showBranchSelectionDialog();
//                           },
//                           icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                           label: Text('$selectedBranch'),
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.white,
//                             padding: EdgeInsets.fromLTRB(0,10,4,10),
//
//                           ),
//                         ),
//                         SizedBox(width: 10), // Add SizedBox for spacing between buttons
//                         ElevatedButton(
//                           onPressed: () {
//                             _fetchDataFromFirebase(selectedCategory, selectedBranch);
//                           },
//                           child: Icon(Icons.check, color: Colors.black),
//                           style: ElevatedButton.styleFrom(
//                             shape: CircleBorder(),
//                             primary: Colors.white,
//                             padding: EdgeInsets.fromLTRB(0,10,4,10),
//                           ),
//                         ),
//                         SizedBox(width: 10), // Add SizedBox for spacing between buttons
//                         ElevatedButton.icon(
//                           onPressed: () {
//                             _showYearSelectionDialog();
//                           },
//                           icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                           label: Text('$selectedYear'),
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.white,
//                             padding: EdgeInsets.fromLTRB(0,10,4,10),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height:1),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _showCategorySelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Category'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: widget.category.map((category) {
//                 return ListTile(
//                   title: Text(category), // Add text to ListTile
//                   onTap: () {
//                     setState(() {
//                       selectedCategory = category;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   _showBranchSelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Branch'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: widget.branch.map((branch) {
//                 return ListTile(
//                   title: Text(branch),
//                   onTap: () {
//                     setState(() {
//                       selectedBranch = branch;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   _showYearSelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Year'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: widget.years.map((year) {
//                 return ListTile(
//                   title: Text(year),
//                   onTap: () {
//                     setState(() {
//                       selectedYear = year;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//
//
//   // Method to fetch data from Firebase based on selected category and branch
//   // void _fetchDataFromFirebase(String category, String branch) {
//   //   FirebaseFirestore.instance
//   //       .collection('College Mate')
//   //       .doc('Institution')
//   //       .collection('Colleges')
//   //       .doc(selectedCollege)
//   //       .collection('DATA')
//   //       .doc(branch) // Use selected branch as document
//   //       .collection(category) // Use selected category as collection
//   //       .get()
//   //       .then((querySnapshot) {
//   //     // Check if data exists
//   //     if (querySnapshot.docs.isNotEmpty) {
//   //       // Data exists, handle it here
//   //       List<QueryDocumentSnapshot> dataDocs = querySnapshot.docs;
//   //       // Now you can use _buildUpdatesNoticesTab to build the UI with fetched data
//   //       setState(() {
//   //         // Set state to trigger UI rebuild
//   //         _buildDisplayNotices(dataDocs);
//   //       });
//   //     } else {
//   //       // No data found for selected category and branch
//   //       print('No data found');
//   //     }
//   //   })
//   //       .catchError((error) {
//   //     // Handle error if any
//   //     print('Error fetching data: $error');
//   //   });
//   // }
//   Widget _fetchDataFromFirebase(String selectedCategory, String selectedBranch) {
//     String collectionName = selectedCategory;  // Default collection name
//     String collectionPath1 = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/NSS/TRAINING & PLACEMENT';
//
//     // String collectionName = 'NSS';  // Default collection name
//     // if (tabName == 'Updates') {
//     //   collectionName = 'DATA';
//     // }
//
//     // String collectionPath1 = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/AVALON';
//     String collectionPath2 = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/NSS/TRAINING & PLACEMENT';
//
//
//    String civilTrainingPlacements = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Civil/TRAINING & PLACEMENT';
//
//     String computerNSS = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/NSS';
//
//     String computerTrainingPlacements = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/TRAINING & PLACEMENT';
//
//
//     return FutureBuilder<List<QuerySnapshot>>(
//       // future: FirebaseFirestore.instance.collection(collectionPath2).get(),
//       // future: FirebaseFirestore.instance.collection(collectionPath2).get(),
//       //
//       // future: FirebaseFirestore.instance
//       //     .collection('College Mate')
//       //     .doc('Institution')
//       //     .collection('Colleges')
//       //     .doc(selectedCollege)
//       //     .collection('DATA')
//       //     .doc('Computer')
//       //     .collection(collectionName)
//       //     .get(),
//
//
//       future: Future.wait([
//
//       FirebaseFirestore.instance.collection(civilTrainingPlacements).get(),
//
//       FirebaseFirestore.instance.collection(computerNSS).get(),
//       FirebaseFirestore.instance.collection(computerTrainingPlacements).get(),
//       ]),
//       builder: (context, AsyncSnapshot<List<QuerySnapshot>> snapshot) {
//         print('Fetching Data...');  // Debugging print
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         if (snapshot.hasError) {
//           print('Error fetching data: ${snapshot.error}');
//           return Center(child: Text('Error fetching data: ${snapshot.error}'));
//         }
//
//         if (!snapshot.hasData ||
//             snapshot.data!.isEmpty ||
//             snapshot.data![0].docs.isEmpty ||
//             snapshot.data![1].docs.isEmpty) {
//           return Center(child: Text('No data available'));
//         }
//
//         List<QueryDocumentSnapshot> dataDocs1 = snapshot.data![0].docs;
//         List<QueryDocumentSnapshot> dataDocs2 = snapshot.data![1].docs;
//
//         List<QueryDocumentSnapshot> combinedDataDocs = [...dataDocs1, ...dataDocs2];
//
//         print('Fetched ${combinedDataDocs.length} documents');
//
//         return _buildDisplayNotices(combinedDataDocs);
//       },
//
//     );
//   }
//
//
//
//
//   Widget _buildDisplayNotices(List<QueryDocumentSnapshot> dataDocs) {
//     return ListView.builder(
//       itemCount: dataDocs.length,
//       itemBuilder: (context, index) {
//         var post = dataDocs[index];
//         var postData = post.data() as Map<String, dynamic>;
//
//         String description = postData['description'] ?? 'No description';
//         String fileUrl = postData['fileUrl'] ?? '';
//         String adminName = postData['Name'] ?? 'Unknown';
//         Timestamp timestamp = postData['timestamp'] ?? Timestamp.now();
//         DateTime dateTime = timestamp.toDate();
//         String formattedDate = DateFormat('dd/MM/yy').format(dateTime);
//
//         bool showFullDescription = false;
//
//         return Container(
//           margin: EdgeInsets.symmetric(vertical: 8),
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xFFA7B8F3), // Lighter blue            // better
//                 Color(0xFF33478A), // Darker blue
//               ],
//             ),
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.3),
//                 spreadRadius: 1,
//                 blurRadius: 4,
//                 offset: Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: Colors.grey[300],
//                         child: Icon(
//                           Icons.person,
//                           color: Colors.black87,
//                           size: 20,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         adminName,
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           foreground: Paint()
//                             ..shader = LinearGradient(
//                               begin: Alignment.topLeft,
//                               end: Alignment.topRight,
//                               colors: [
//                                 Color(0xff1f0b48),
//                                 Color(0xff185a9d),
//                               ],
//                             ).createShader(
//                               Rect.fromLTWH(0, 0, 200, 70),
//                             ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     formattedDate,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 12),
//               Text(
//                 showFullDescription ? description : (description),
//                 maxLines: showFullDescription ? null : 3,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.normal,
//                   color: Colors.black,
//                 ),
//               ),
//               if (description.length > 100)
//                 TextButton(
//                   onPressed: () {
//                     setState(() {
//                       showFullDescription = !showFullDescription;
//                     });
//                   },
//                   child: Text(
//                     showFullDescription ? 'Read Less' : 'Read More',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               SizedBox(height: 12),
//               if (fileUrl.isNotEmpty)
//                 Image.network(
//                   fileUrl,
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//             ],
//           ),
//         );
//       },
//       padding: EdgeInsets.all(8),
//     );
//   }
//
//
//
//
//
//
//
//   LinearGradient customLinearGradient() {
//     return const LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.topRight,
//       colors: [
//         Color(0xff43cea2),
//         Color(0xff185a9d),
//       ],
//     );
//   }
// }
//
//
//







/////////////////////        4       ////////////////////////////////////////////////   try using on the spot code








import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    'EVENTS',
    'FESTS',
    'IMP',
    'TRAINING & PLACEMENT',
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
  String? studentId;  // Define studentId here

  _getSelectedCollege() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCollege = prefs.getString('selectedCollege');
    });
  }

  _getStudentId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      studentId = prefs.getString('studentId');  // Assuming 'studentId' is stored as a string in SharedPreferences
    });
  }

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category.first;
    selectedBranch = widget.branch.first;
    selectedYear = widget.years.first;

    _getSelectedCollege();
    _getStudentId();  // Fetch studentId
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
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
                            padding: EdgeInsets.fromLTRB(0,10,4,10),
                          ),
                        ),
                        SizedBox(width: 10), // Add SizedBox for spacing between buttons
                        ElevatedButton.icon(
                          onPressed: () {
                            _showBranchSelectionDialog();
                          },
                          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                          label: Text('$selectedBranch'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.fromLTRB(0,10,4,10),

                          ),
                        ),
                        SizedBox(width: 10), // Add SizedBox for spacing between buttons
                        ElevatedButton(
                          onPressed: () {
                            // _fetchDataFromFirebase(selectedCategory, selectedBranch);
                          },
                          child: Icon(Icons.check, color: Colors.black),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: Colors.white,
                            padding: EdgeInsets.fromLTRB(0,10,4,10),
                          ),
                        ),
                        SizedBox(width: 10), // Add SizedBox for spacing between buttons
                        ElevatedButton.icon(
                          onPressed: () {
                            _showYearSelectionDialog();
                          },
                          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                          label: Text('$selectedYear'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.fromLTRB(0,10,4,10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:1),
            _fetchDataFromFirebase(),

          ],
        ),
      ),
    );
  }


  Widget _fetchDataFromFirebase() {
    String collectionPath = 'College Mate/Institution/Colleges/$selectedCollege/DATA/$selectedBranch/$selectedCategory';

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(collectionPath).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error fetching data: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No data available'));
        }

        List<QueryDocumentSnapshot> dataDocs = snapshot.data!.docs;

        return _buildDisplayNotices(dataDocs);
      },
    );
  }

  // Widget _buildDisplayNotices(List<QueryDocumentSnapshot> dataDocs) {
  //   return ListView.builder(
  //     shrinkWrap: true,
  //     physics: NeverScrollableScrollPhysics(),
  //     itemCount: dataDocs.length,
  //     itemBuilder: (context, index) {
  //       var post = dataDocs[index];
  //       var postData = post.data() as Map<String, dynamic>;
  //
  //       String description = postData['description'] ?? 'No description';
  //       String fileUrl = postData['fileUrl'] ?? '';
  //       String adminName = postData['Name'] ?? 'Unknown';
  //       Timestamp timestamp = postData['timestamp'] ?? Timestamp.now();
  //       DateTime dateTime = timestamp.toDate();
  //       String formattedDate = DateFormat('dd/MM/yy').format(dateTime);
  //
  //       return Container(
  //         margin: EdgeInsets.symmetric(vertical: 8),
  //         padding: EdgeInsets.all(16),
  //         decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             begin: Alignment.topLeft,
  //             end: Alignment.bottomRight,
  //             colors: [
  //               Color(0xFFA7B8F3),
  //               Color(0xFF33478A),
  //             ],
  //           ),
  //           borderRadius: BorderRadius.circular(12),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey.withOpacity(0.3),
  //               spreadRadius: 1,
  //               blurRadius: 4,
  //               offset: Offset(0, 2),
  //             ),
  //           ],
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     CircleAvatar(
  //                       backgroundColor: Colors.grey[300],
  //                       child: Icon(
  //                         Icons.person,
  //                         color: Colors.black87,
  //                         size: 20,
  //                       ),
  //                     ),
  //                     SizedBox(width: 8),
  //                     Text(
  //                       adminName,
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.black,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Text(
  //                   formattedDate,
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                     color: Colors.black54,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: 12),
  //             Text(
  //               description,
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.normal,
  //                 color: Colors.black,
  //               ),
  //             ),
  //             SizedBox(height: 12),
  //             if (fileUrl.isNotEmpty)
  //               Image.network(
  //                 fileUrl,
  //                 width: double.infinity,
  //                 height: 200,
  //                 fit: BoxFit.cover,
  //               ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  Widget _buildDisplayNotices(List<QueryDocumentSnapshot> dataDocs) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: dataDocs.length,
      itemBuilder: (context, index) {
        var post = dataDocs[index];
        var postData = post.data() as Map<String, dynamic>;

        String description = postData['description'] ?? 'No description';
        String fileUrl = postData['fileUrl'] ?? '';
        String adminName = postData['Name'] ?? 'Unknown';
        Timestamp timestamp = postData['timestamp'] ?? Timestamp.now();
        DateTime dateTime = timestamp.toDate();
        String formattedDate = DateFormat('dd/MM/yy').format(dateTime);

        bool showFullDescription = false;

        return Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                // Color(0xFF64B6FF), // Light blue              // not better than below
                // Color(0xFF185A9D), // Dark blue
                Color(0xFFA7B8F3), // Lighter blue            // better
                Color(0xFF33478A), // Darker blue
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          color: Colors.black87,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        adminName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xff1f0b48),
                                Color(0xff185a9d),
                                // Color(0xffE2E2E2), // Light grey
                                // Color(0xffC0C0C0), // Darker grey
                              ],
                            ).createShader(
                                Rect.fromLTWH(0, 0, 200, 70)), // Adjust the Rect as needed
                        ),
                      ),
                    ],
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                showFullDescription ? description : (description),
                maxLines: showFullDescription ? null : 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              if (description.length > 100)
                TextButton(
                  onPressed: () {
                    setState(() {
                      showFullDescription = !showFullDescription;
                    });
                  },
                  child: Text(
                    showFullDescription ? 'Read Less' : 'Read More',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ),
              SizedBox(height: 12),
              if (fileUrl.isNotEmpty)
                Image.network(
                  fileUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
            ],
          ),
        );
      },
      padding: EdgeInsets.all(8),
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
                  title: Text(category), // Add text to ListTile
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



