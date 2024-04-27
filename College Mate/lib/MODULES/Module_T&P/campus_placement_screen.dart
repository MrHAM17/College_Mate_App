// import 'package:flutter/material.dart';
// import 'package:mech_it/UTILS/constants/colors.dart';
// import 'package:mech_it/UTILS/imageview/imageViewer.dart';
//
// class CampusPlacementScreen extends StatefulWidget {
//   String role;
//   CampusPlacementScreen({Key? key, required this.role}) : super(key: key);
//
//   @override
//   _CampusPlacementScreenState createState() => _CampusPlacementScreenState();
// }
//
// class _CampusPlacementScreenState extends State<CampusPlacementScreen> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
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
//             // borderRadius: BorderRadius.only(
//             //   bottomLeft: Radius.circular(20),
//             //   bottomRight: Radius.circular(20),
//             // ),
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
//               'Campus Placement',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//             centerTitle: true,
//             bottom: TabBar(
//               controller: _tabController,
//               indicator: BoxDecoration(
//                 // gradient: customLinearGradient(),
//                 color: Colors.white30,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               labelColor: Colors.black,
//               unselectedLabelColor: Colors.white,
//               tabs: [
//                 Tab(text: 'Updates'),
//                 Tab(text: 'My App.'),
//                 Tab(text: 'My Toolkit'),
//               ],
//               padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16),  // Added space from left and right
//         child: TabBarView(
//           controller: _tabController,
//           children: [
//             _buildUpdatesNoticesTab(),
//             _buildAppliedOpportunitiesTab(),
//             _buildToolkitTab(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildUpdatesNoticesTab() {
//     return ListView.builder(
//       itemCount: 5, // Replace with actual data count
//       itemBuilder: (context, index) {
//         return Card(
//           margin: EdgeInsets.symmetric(vertical: 8),
//           child: ListTile(
//             title: Text('Update ${index + 1}'),
//             subtitle: Text('Details about update ${index + 1}'),
//             onTap: () {
//               // Navigate to update details page or display update
//             },
//           ),
//         );
//       },
//       padding: EdgeInsets.fromLTRB(0,6, 0, 0),
//     );
//   }
//
//   Widget _buildAppliedOpportunitiesTab() {
//     return ListView.builder(
//       itemCount: 3, // Replace with actual data count
//       itemBuilder: (context, index) {
//         return Card(
//           margin: EdgeInsets.symmetric(vertical: 8),
//           child: ListTile(
//             title: Text('Applied Opportunity ${index + 1}'),
//             subtitle: Text('Details about applied opportunity ${index + 1}'),
//             onTap: () {
//               // Navigate to applied opportunity details page
//             },
//           ),
//         );
//       },
//       padding: EdgeInsets.fromLTRB(0,6, 0, 0),
//     );
//   }
//
//
//
//   Widget _buildToolkitTab() {
//     return GridView.count(
//       padding: EdgeInsets.fromLTRB(0,6, 0, 0),
//       crossAxisCount: 2,
//       childAspectRatio: 1.0,
//       mainAxisSpacing: 15.0,
//       crossAxisSpacing: 15.0,
//       children: [
//         _buildCubeCard(
//           title: 'Search',
//           icon: Icons.search,
//           onTap: () {
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => YourSearchPage(), // Replace 'YourSearchPage' with the name of your search page
//             //   ),
//             // );
//           },
//         ),
//         _buildCubeCard(
//           title: 'Apply',
//           icon: Icons.check_circle,
//           onTap: () {
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => StudyMaterialScreen(), // Replace 'YourSearchPage' with the name of your search page
//             //   ),
//             // );
//             },
//         ),
//         _buildCubeCard(
//           title: 'Progress',
//           icon: Icons.show_chart,
//           onTap: () {
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => YourSearchPage(), // Replace 'YourSearchPage' with the name of your search page
//             //   ),
//             // );
//           },
//         ),
//       ],
//     );
//   }
//
//   Widget _buildCubeCard({required String title, required IconData icon, required VoidCallback onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         elevation: 5.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               size: 50.0,
//               color: Colors.blue,
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
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





import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mech_it/UTILS/constants/colors.dart';
import 'package:mech_it/UTILS/imageview/imageViewer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'apply_opp.dart';

class CampusPlacementScreen extends StatefulWidget {
  String role;
  CampusPlacementScreen({Key? key, required this.role}) : super(key: key);

  @override
  _CampusPlacementScreenState createState() => _CampusPlacementScreenState();
}

class _CampusPlacementScreenState extends State<CampusPlacementScreen> with SingleTickerProviderStateMixin {
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
    _getSelectedCollege();
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
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('College Mate')
          .doc('Institution')
          .collection('Colleges')
          .doc(selectedCollege) // Make sure to define selectedCollege
          .collection('DATA')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        List<DocumentSnapshot> documents = snapshot.data!.docs;

        switch (tabName) {
          case 'Updates':
            return _buildUpdatesNoticesTab(documents);
          case 'My App.':
            return _buildAppliedOpportunitiesTab(documents);
          case 'My Toolkit':
            return _buildToolkitTab();
          default:
            return Center(child: Text('Invalid Tab'));
        }
      },
    );
  }

  Widget _buildUpdatesNoticesTab(List<DocumentSnapshot> documents) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (context, index) {
        var data = documents[index].data() as Map<String, dynamic>?;

        var description = data?['description'] ?? 'No description';
        var fileUrl = data?['fileUrl'] as String?;
        var adminName = data?['Name'] ?? 'Unknown';

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description),
                SizedBox(height: 8),
                Text('Posted By: $adminName'),
              ],
            ),
            subtitle: fileUrl != null ? Container(width: 200, height: 300, child: Image.network(fileUrl)) : null,
            onTap: () {
              // Navigate to update details page or display update
              if (fileUrl != null) {
                // Open file or show file details
              } else {
                // Navigate or display text details
              }
            },
          ),
        );
      },
      padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
    );
  }

  Widget _buildAppliedOpportunitiesTab(List<DocumentSnapshot> documents) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (context, index) {
        var description = documents[index].get('description');
        var fileUrl = documents[index].get('fileUrl');
        var adminName = documents[index].get('Name');

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description ?? ''),
                SizedBox(height: 8),
                Text('Posted By: ${adminName ?? 'Unknown'}'),
              ],
            ),
            subtitle: fileUrl != null ? Container(width: 200, height: 300, child: Image.network(fileUrl)) : null,
            onTap: () {
              // Navigate to applied opportunity details page
              if (fileUrl != null) {
                // Open file or show file details
              } else {
                // Navigate or display text details
              }
            },
          ),
        );
      },
      padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
    );
  }


  Widget _buildToolkitTab() {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      children: [
        _buildCubeCard(
          title: 'Search',
          icon: Icons.search,
          onTap: () {
            // Navigate to search page
          },
        ),
        _buildCubeCard(
          title: 'Apply',
          icon: Icons.check_circle,
          onTap: () {
            showApplyForm(context, 'My App.', selectedCollege!);  // Call the updated _showApplyForm function
          },
        ),
        _buildCubeCard(
          title: 'Progress',
          icon: Icons.show_chart,
          onTap: () {
            // Navigate to progress page
          },
        ),
      ],
    );
  }

  Widget _buildCubeCard({required String title, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Colors.blue,
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
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