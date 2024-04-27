

//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:intl/intl.dart';
// import 'package:mech_it/UTILS/constants/colors.dart';
// import 'package:mech_it/UTILS/imageview/imageViewer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'package:rxdart/rxdart.dart';  // <-- Import rxdart
// import 'package:async/async.dart';
//
//
// class CampusFusionScreen extends StatefulWidget {
//   final String? selectedCollege;
//   final String? studentBranch;
//   final String? studentId;
//
//   CampusFusionScreen({
//     Key? key,
//     this.selectedCollege,
//     this.studentId,
//     this.studentBranch,
//   }) : super(key: key);
//
//
//   List<String> category = [
//     // 'All',
//     'IMP',
//     'ANTRANG',
//     'AVALON',
//     'NSS',
//     'REVIVE',
//     'RESONANCE',
//     'SPORTEC',
//     'EVENTS',
//     'FESTS',
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
//   List<String> years = ['2024', '2023', '2022', '2021'];
//
//   @override
//   _CampusFusionScreenState createState() => _CampusFusionScreenState();
// }
//
// class _CampusFusionScreenState extends State<CampusFusionScreen> with SingleTickerProviderStateMixin {
//   late String selectedCategory;
//   late String selectedBranch;
//   late String selectedYear;
//
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedCategory = widget.category.first;
//     selectedBranch = widget.branch.first;
//     selectedYear = widget.years.first;
//
//     _tabController = TabController(length: 1, vsync: this);  // Initialize TabController
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(122),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: customLinearGradient(),
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: AppBar(
//             elevation: 10,
//             backgroundColor: Colors.transparent,
//             title: Text(
//               'Campus Fusion',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//             centerTitle: true,
//
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(60),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SizedBox(width: 10), // Add SizedBox for spacing between buttons
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _showCategorySelectionDialog();
//                       },
//                       icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                       label: Text('$selectedCategory'),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         padding: EdgeInsets.fromLTRB(0,10,4,10),
//                       ),
//                     ),
//                     SizedBox(width: 10), // Add SizedBox for spacing between buttons
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _showBranchSelectionDialog();
//                       },
//                       icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                       label: Text('$selectedBranch'),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         padding: EdgeInsets.fromLTRB(0,10,4,10),
//                       ),
//                     ),
//                     SizedBox(width: 10), // Add SizedBox for spacing between buttons
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _showYearSelectionDialog();
//                       },
//                       icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                       label: Text('$selectedYear'),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         padding: EdgeInsets.fromLTRB(0,10,4,10),
//                       ),
//                     ),
//                     SizedBox(width: 10), // Add SizedBox for spacing between buttons
//                   ].map((widget) => Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0), // Add space below each button
//                     child: widget,
//                   )).toList(),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//
//
//
//       body: SingleChildScrollView(
//         primary: false,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height:1),
//             _fetchDataFromFirebase(),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   Widget _fetchDataFromFirebase() {
//     // String collectionPath;
//     String collectionPath = 'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA/${selectedBranch}/${selectedCategory}';
//
//     // String collectionPath1;
//     // String collectionPath2;
//
//     // collectionPath1 = 'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA/${selectedBranch}/RESONANCE';
//     // collectionPath2 = 'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA/${selectedBranch}/TRAINING & PLACEMENT';
//
//     // if (selectedBranch != 'All' && selectedCategory == 'All') {
//     //   collectionPath = 'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA/${selectedBranch}';
//     // } else if (selectedBranch == 'All' && selectedCategory == 'All') {
//     //   collectionPath = 'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA';
//     // } else {
//     //   collectionPath = 'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA/${selectedBranch}/${selectedCategory}';
//     // }
//
//     // Merge streams using rxdart
//     // var stream1 = FirebaseFirestore.instance.collection(collectionPath1).snapshots();
//     // var stream2 = FirebaseFirestore.instance.collection(collectionPath2).snapshots();
//     // var mergedStream = StreamGroup.merge([stream1, stream2]);  // <-- Use StreamGroup.merge here
//
//
//     // Use combineLatest instead of merge
//     // var combinedStream = Rx.combineLatest2(stream1, stream2, (a, b) => [a, b]);
//     // var combinedStream = Rx.combineLatest2(stream1, stream2, (a, b) => [a.docs, b.docs]); // <-- Changed this line
//
//     return StreamBuilder<QuerySnapshot>(
//       // return StreamBuilder<QuerySnapshot>(
//       // return StreamBuilder<List<List<QueryDocumentSnapshot>>>( // <-- Changed this line
//
//       stream: FirebaseFirestore.instance.collection(collectionPath).snapshots(),
//       // stream: FirebaseFirestore.instance.collection(collectionPath).snapshots(),
//       // stream: FirebaseFirestore.instance.collection(collectionPath1).snapshots(),
//
//       // stream: mergedStream,  // Use the merged stream here
//       // stream: combinedStream,
//
//
//       builder: (context, snapshot) {
//         // if (snapshot.connectionState == ConnectionState.waiting) {  return Center(child: CircularProgressIndicator());  }
//         //
//         // if (snapshot.hasError) {  return Center(child: Text('Error fetching data: ${snapshot.error}')); }
//         //
//         // if (!snapshot.hasData || snapshot.data!.docs.isEmpty) { return Center(child: Text('No data available'));  }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         if (snapshot.hasError) {
//           return Center(child: Text('\n\n\n\n\n\n\n\n\n\nError fetching data: ${snapshot.error}'));
//         }
//
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Center(child: Text('\n\n\n\n\n\n\n\n\n\nNo data available', style: TextStyle(fontSize: 18)));
//         }
//
//         List<QueryDocumentSnapshot> dataDocs = snapshot.data!.docs;
//         return _buildDisplayNotices(dataDocs);
//
//         // List<QueryDocumentSnapshot> dataDocs1 = snapshot.data![0].docs;
//         // List<QueryDocumentSnapshot> dataDocs2 = snapshot.data![1].docs;
//
//         // Combine data from both streams
//         // List<QueryDocumentSnapshot> combinedDataDocs = [...dataDocs1, ...dataDocs2];
//         // return _buildDisplayNotices(combinedDataDocs);
//       },
//     );
//   }
//
//   Widget _buildDisplayNotices(List<QueryDocumentSnapshot> dataDocs) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
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
//                 // Color(0xFF64B6FF), // Light blue              // not better than below
//                 // Color(0xFF185A9D), // Dark blue
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
//                                 // Color(0xffE2E2E2), // Light grey
//                                 // Color(0xffC0C0C0), // Darker grey
//                               ],
//                             ).createShader(
//                                 Rect.fromLTWH(0, 0, 200, 70)), // Adjust the Rect as needed
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



















import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:mech_it/UTILS/constants/colors.dart';
import 'package:mech_it/UTILS/imageview/imageViewer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rxdart/rxdart.dart';  // <-- Import rxdart
import 'package:async/async.dart';


class CampusFusionScreen extends StatefulWidget {
  final String? selectedCollege;
  final String? studentBranch;
  final String? studentId;

  CampusFusionScreen({
    Key? key,
    this.selectedCollege,
    this.studentId,
    this.studentBranch,
  }) : super(key: key);


  List<String> category = [
    // 'All',
    'IMP',
    'ANTRANG',
    'AVALON',
    'NSS',
    'REVIVE',
    'RESONANCE',
    'SPORTEC',
    'EVENTS',
    'FESTS',
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

  List<String> guestCategory = [
    'ANTRANG',
    'AVALON',
    'NSS',
    'REVIVE',
    'RESONANCE',
    'SPORTEC',
    'EVENTS',
    'FESTS',
  ];

  List<String> guestBranch = [
    'AIDS',
    'Civil',
    'Computer',
    'EXTC',
    'IT',
    'Mechanic',
    'Mechatronics',
  ];

  List<String> years = ['2024', '2023', '2022', '2021'];

  @override
  _CampusFusionScreenState createState() => _CampusFusionScreenState();
}

class _CampusFusionScreenState extends State<CampusFusionScreen> with SingleTickerProviderStateMixin {
  late String selectedCategory;
  late String selectedBranch;
  late String selectedYear;

  late TabController _tabController;
  late List<Map<String, dynamic>> postsData;
  late List<String> displayedCategories;
  late List<String> displayedBranches;


  @override
  void initState() {
    super.initState();
    // selectedCategory = widget.category.first;
    // selectedBranch = widget.branch.first;
    selectedYear = widget.years.first;

    if (widget.studentBranch == 'Guest Screen' || widget.studentId == 'Guest Mode') {
      selectedCategory = widget.guestCategory.first;
      selectedBranch = widget.guestBranch.first;
      displayedCategories = widget.guestCategory;
      displayedBranches = widget.guestBranch;
    } else {
      selectedCategory = widget.category.first;
      selectedBranch = widget.branch.first;
      displayedCategories = widget.category;
      displayedBranches = widget.branch;
    }

    _tabController = TabController(length: 1, vsync: this);  // Initialize TabController
    postsData = [];
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
            // title: Text(
            //   'Campus Fusion',
            //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            // ),
            title: Text(
              widget.studentBranch == 'Guest Screen' || widget.studentId == 'Guest Mode'
                  ? 'Campus Events'
                  : 'Campus Fusion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            centerTitle: true,

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 10), // Add SizedBox for spacing between buttons
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
                    SizedBox(width: 10), // Add SizedBox for spacing between buttons
                  ].map((widget) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0), // Add space below each button
                    child: widget,
                  )).toList(),
                ),
              ),
            ),
          ),
        ),
      ),



      body: SingleChildScrollView(
        primary: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height:1),
            _fetchDataFromFirebase(),
          ],
        ),
      ),
    );
  }

  Widget _fetchDataFromFirebase() {
    String collectionPath = 'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA/${selectedBranch}/${selectedCategory}';

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(collectionPath).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('\n\n\n\n\n\n\n\n\n\nError fetching data: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('\n\n\n\n\n\n\n\n\n\nNo data available', style: TextStyle(fontSize: 18)));
        }

        List<QueryDocumentSnapshot> dataDocs = snapshot.data!.docs;
        return _buildDisplayNotices(dataDocs);
      },
    );
  }

  Widget _buildDisplayNotices(List<QueryDocumentSnapshot> dataDocs) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: dataDocs.length,
      itemBuilder: (context, index) {
        return PostItem(postData: dataDocs[index].data() as Map<String, dynamic>);
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
              // children: widget.category.map((category) {
              children: displayedCategories.map((category) {
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
              // children: widget.branch.map((branch) {
              children: displayedBranches.map((branch) {
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



class PostItem extends StatefulWidget {
  final Map<String, dynamic> postData;

  PostItem({required this.postData});

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool showFullDescription = true;

  @override
  Widget build(BuildContext context) {
    String description = widget.postData['description'] ?? 'No description';
    String fileUrl = widget.postData['fileUrl'] ?? '';
    String adminName = widget.postData['Name'] ?? 'Unknown';
    Timestamp timestamp = widget.postData['timestamp'] ?? Timestamp.now();
    DateTime dateTime = timestamp.toDate();
    String formattedDate = DateFormat('dd/MM/yy').format(dateTime);

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
          if (description.length > 30)
            TextButton(
              onPressed: () {
                setState(() {
                  showFullDescription = !showFullDescription;
                });
              },
              child: Text(
                showFullDescription ? 'Read More' : 'Read Less',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
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
  }
}

