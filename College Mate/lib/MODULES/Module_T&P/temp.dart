//
//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mech_it/UTILS/constants/colors.dart';
// import 'package:mech_it/UTILS/imageview/imageViewer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'apply_cp_opp_page.dart';
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
//   late String selectedCategory;
//   late String selectedBranch;
//   String? selectedCollege;
//
//
//   _getSelectedCollege() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       selectedCollege = prefs.getString('selectedCollege');
//       print('Selected College: $selectedCollege');  // Debugging print
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _getSelectedCollege();
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
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         child: TabBarView(
//           controller: _tabController,
//           children: [
//             _buildTabView('Updates'),
//             _buildTabView('My App.'),
//             _buildTabView('My Toolkit'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget _buildTabView(String tabName) {
//   //   // String collectionName = 'Training & Placements';  // Default collection name
//   //   // String collectionName = 'NSS';  // Default collection name
//   //   // if (tabName == 'Updates') {
//   //   //   collectionName = 'DATA';
//   //   // }
//   //
//   //   String collectionPath1 = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/AVALON';
//   //   String collectionPath2 = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/NSS';
//   //
//   //
//   //   return FutureBuilder<QuerySnapshot>(
//   //     future: FirebaseFirestore.instance.collection(collectionPath1).get(),
//   //     future: FirebaseFirestore.instance.collection(collectionPath2).get(),
//   //
//   //     // future: FirebaseFirestore.instance
//   //     //     .collection('College Mate')
//   //     //     .doc('Institution')
//   //     //     .collection('Colleges')
//   //     //     .doc(selectedCollege)
//   //     //     .collection('DATA')
//   //     //     .doc('Computer')
//   //     //     .collection(collectionName)
//   //     //     .get(),
//   //     builder: (context, snapshot) {
//   //       print('Fetching Data...');  // Debugging print
//   //       if (snapshot.connectionState == ConnectionState.waiting) {
//   //         return Center(child: CircularProgressIndicator());
//   //       }
//   //
//   //       if (snapshot.hasError) {
//   //         print('Error fetching data: ${snapshot.error}');
//   //         return Center(child: Text('Error fetching data: ${snapshot.error}'));
//   //       }
//   //
//   //       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//   //         return Center(child: Text('No data available'));
//   //       }
//   //
//   //       // snapshot.connectionState == ConnectionState.done;
//   //
//   //       List<QueryDocumentSnapshot> dataDocs = snapshot.data!.docs;
//   //
//   //       print('Fetched ${dataDocs.length} documents');
//   //
//   //
//   //       switch (tabName) {
//   //         case 'Updates':
//   //           print('Building Updates Tab with ${dataDocs.length} documents');  // Debugging print
//   //           return _buildUpdatesNoticesTab(dataDocs);
//   //         case 'My App.':
//   //           print('Building My App Tab with ${dataDocs.length} documents');  // Debugging print
//   //           return _buildAppliedOpportunitiesTab(dataDocs);
//   //         case 'My Toolkit':
//   //           print('Building My Toolkit Tab');  // Debugging print
//   //           return _buildToolkitTab();
//   //         default:
//   //           return Center(child: Text('Invalid Tab'));
//   //       }
//   //     },
//   //   );
//   // }
//
//   Widget _buildTabView(String tabName) {
//
//     // String aidsANTRANG = 'College Mate/Institution/Colleges/$selectedCollege/DATA/AIDS/ANTRANG';
//     // String aidsAVALON = 'College Mate/Institution/Colleges/$selectedCollege/DATA/AIDS/AVALON';
//     // String aidsNSS = 'College Mate/Institution/Colleges/$selectedCollege/DATA/AIDS/NSS';
//     // String aidsREVIVE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/AIDS/REVIVE';
//     // String aidsRESONANCE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/AIDS/RESONANCE';
//     // String aidsSPORTEC = 'College Mate/Institution/Colleges/$selectedCollege/DATA/AIDS/SPORTEC';
//     // String aidsEvents = 'College Mate/Institution/Colleges/$selectedCollege/DATA/AIDS/EVENTS';
//     // String aidsFests = 'College Mate/Institution/Colleges/$selectedCollege/DATA/AIDS/FESTS';
//     // String aidsIMP = 'College Mate/Institution/Colleges/$selectedCollege/DATA/AIDS/IMP';
//     // String aidsTrainingPlacements = 'College Mate/Institution/Colleges/$selectedCollege/DATA/AIDS/TRAINING & PLACEMENT';
//
//     String civilANTRANG = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Civil/ANTRANG';
//     String civilAVALON = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Civil/AVALON';
//     String civilNSS = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Civil/NSS';
//     String civilREVIVE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Civil/REVIVE';
//     String civilRESONANCE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Civil/RESONANCE';
//     String civilSPORTEC = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Civil/SPORTEC';
//     String civilEvents = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Civil/EVENTS';
//     String civilFests = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Civil/FESTS';
//     String civilIMP = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Civil/IMP';
//     String civilTrainingPlacements = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Civil/TRAINING & PLACEMENT';
//
//     String computerANTRANG = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/ANTRANG';
//     String computerAVALON = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/AVALON';
//     String computerNSS = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/NSS';
//     String computerREVIVE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/REVIVE';
//     String computerRESONANCE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/RESONANCE';
//     String computerSPORTEC = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/SPORTEC';
//     String computerEvents = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/EVENTS';
//     String computerFests = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/FESTS';
//     String computerIMP = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/IMP';
//     String computerTrainingPlacements = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/TRAINING & PLACEMENT';
//
//     // String extcANTRANG = 'College Mate/Institution/Colleges/$selectedCollege/DATA/EXTC/ANTRANG';
//     // String extcAVALON = 'College Mate/Institution/Colleges/$selectedCollege/DATA/EXTC/AVALON';
//     // String extcNSS = 'College Mate/Institution/Colleges/$selectedCollege/DATA/EXTC/NSS';
//     // String extcREVIVE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/EXTC/REVIVE';
//     // String extcRESONANCE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/EXTC/RESONANCE';
//     // String extcSPORTEC = 'College Mate/Institution/Colleges/$selectedCollege/DATA/EXTC/SPORTEC';
//     // String extcEvents = 'College Mate/Institution/Colleges/$selectedCollege/DATA/EXTC/EVENTS';
//     // String extcFests = 'College Mate/Institution/Colleges/$selectedCollege/DATA/EXTC/FESTS';
//     // String extcIMP = 'College Mate/Institution/Colleges/$selectedCollege/DATA/EXTC/IMP';
//     // String extcTrainingPlacements = 'College Mate/Institution/Colleges/$selectedCollege/DATA/EXTC/TRAINING & PLACEMENT';
//     //
//     // String itANTRANG = 'College Mate/Institution/Colleges/$selectedCollege/DATA/IT/ANTRANG';
//     // String itAVALON = 'College Mate/Institution/Colleges/$selectedCollege/DATA/IT/AVALON';
//     // String itNSS = 'College Mate/Institution/Colleges/$selectedCollege/DATA/IT/NSS';
//     // String itREVIVE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/IT/REVIVE';
//     // String itRESONANCE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/IT/RESONANCE';
//     // String itSPORTEC = 'College Mate/Institution/Colleges/$selectedCollege/DATA/IT/SPORTEC';
//     // String itEvents = 'College Mate/Institution/Colleges/$selectedCollege/DATA/IT/EVENTS';
//     // String itFests = 'College Mate/Institution/Colleges/$selectedCollege/DATA/IT/FESTS';
//     // String itIMP = 'College Mate/Institution/Colleges/$selectedCollege/DATA/IT/IMP';
//     // String itTrainingPlacements = 'College Mate/Institution/Colleges/$selectedCollege/DATA/IT/TRAINING & PLACEMENT';
//     //
//     // String mechanicANTRANG = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechanic/ANTRANG';
//     // String mechanicAVALON = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechanic/AVALON';
//     // String mechanicNSS = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechanic/NSS';
//     // String mechanicREVIVE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechanic/REVIVE';
//     // String mechanicRESONANCE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechanic/RESONANCE';
//     // String mechanicSPORTEC = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechanic/SPORTEC';
//     // String mechanicEvents = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechanic/EVENTS';
//     // String mechanicFests = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechanic/FESTS';
//     // String mechanicIMP = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechanic/IMP';
//     // String mechaniccTrainingPlacements = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechanic/TRAINING & PLACEMENT';
//     //
//     // String mechatronicsANTRANG = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechatronics/ANTRANG';
//     // String mechatronicsAVALON = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechatronics/AVALON';
//     // String mechatronicsNSS = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechatronics/NSS';
//     // String mechatronicsREVIVE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechatronics/REVIVE';
//     // String mechatronicsRESONANCE = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechatronics/RESONANCE';
//     // String mechatronicsSPORTEC = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechatronics/SPORTEC';
//     // String mechatronicsEvents = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechatronics/EVENTS';
//     // String mechatronicsFests = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechatronics/FESTS';
//     // String mechatronicsIMP = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechatronics/IMP';
//     // String mechatronicsTrainingPlacements = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Mechatronics/TRAINING & PLACEMENT';
//
//
//
//     return FutureBuilder<List<QuerySnapshot>>(
//       future: Future.wait([
//         // FirebaseFirestore.instance.collection(aidsANTRANG).get(),
//         // FirebaseFirestore.instance.collection(aidsAVALON).get(),
//         // FirebaseFirestore.instance.collection(aidsNSS).get(),
//         // FirebaseFirestore.instance.collection(aidsREVIVE).get(),
//         // FirebaseFirestore.instance.collection(aidsRESONANCE).get(),
//         // FirebaseFirestore.instance.collection(aidsSPORTEC).get(),
//         // FirebaseFirestore.instance.collection(aidsEvents).get(),
//         // FirebaseFirestore.instance.collection(aidsFests).get(),
//         // FirebaseFirestore.instance.collection(aidsIMP).get(),
//         // FirebaseFirestore.instance.collection(aidsTrainingPlacements).get(),
//
//         FirebaseFirestore.instance.collection(civilANTRANG).get(),
//         FirebaseFirestore.instance.collection(civilAVALON).get(),
//         FirebaseFirestore.instance.collection(civilNSS).get(),
//         FirebaseFirestore.instance.collection(civilREVIVE).get(),
//         FirebaseFirestore.instance.collection(civilRESONANCE).get(),
//         FirebaseFirestore.instance.collection(civilSPORTEC).get(),
//         FirebaseFirestore.instance.collection(civilEvents).get(),
//         FirebaseFirestore.instance.collection(civilFests).get(),
//         FirebaseFirestore.instance.collection(civilIMP).get(),
//         FirebaseFirestore.instance.collection(civilTrainingPlacements).get(),
//
//         FirebaseFirestore.instance.collection(computerANTRANG).get(),
//         FirebaseFirestore.instance.collection(computerAVALON).get(),
//         FirebaseFirestore.instance.collection(computerNSS).get(),
//         FirebaseFirestore.instance.collection(computerREVIVE).get(),
//         FirebaseFirestore.instance.collection(computerRESONANCE).get(),
//         FirebaseFirestore.instance.collection(computerSPORTEC).get(),
//         FirebaseFirestore.instance.collection(computerEvents).get(),
//         FirebaseFirestore.instance.collection(computerFests).get(),
//         FirebaseFirestore.instance.collection(computerIMP).get(),
//         FirebaseFirestore.instance.collection(computerTrainingPlacements).get(),
//
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         //
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         //
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         //
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
//         // FirebaseFirestore.instance.collection().get(),
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
//         switch (tabName) {
//           case 'Updates':
//             print('Building Updates Tab with ${combinedDataDocs.length} documents');  // Debugging print
//             return _buildUpdatesNoticesTab(combinedDataDocs);
//           case 'My App.':
//             print('Building My App Tab with ${combinedDataDocs.length} documents');  // Debugging print
//             return _buildAppliedOpportunitiesTab(combinedDataDocs);
//           case 'My Toolkit':
//             print('Building My Toolkit Tab');  // Debugging print
//             return _buildToolkitTab();
//           default:
//             return Center(child: Text('Invalid Tab'));
//         }
//       },
//     );
//   }
//
//
//   Widget _buildUpdatesNoticesTab(List<QueryDocumentSnapshot> dataDocs) {
//     return ListView.builder(
//       itemCount: dataDocs.length,
//       itemBuilder: (context, index) {
//         var post = dataDocs[index];
//         var postData = post.data() as Map<String, dynamic>;
//
//         String description = postData['description'] ?? 'No description';
//         String fileUrl = postData['fileUrl'] ?? '';
//         String adminName = postData['Name'] ?? 'Unknown';
//
//         return Container(
//           margin: EdgeInsets.symmetric(vertical: 8),
//           padding: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 description,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Text('Posted By: $adminName'),
//               SizedBox(height: 8),
//               fileUrl.isNotEmpty
//                   ? Image.network(
//                 fileUrl,
//                 width: double.infinity,
//                 height: 200,
//                 fit: BoxFit.cover,
//               )
//                   : SizedBox.shrink(),
//             ],
//           ),
//         );
//       },
//       padding: EdgeInsets.all(8),
//     );
//   }
//
//   Widget _buildAppliedOpportunitiesTab(List<DocumentSnapshot> documents) {
//     return ListView.builder(
//       itemCount: documents.length,
//       itemBuilder: (context, index) {
//         var description = documents[index].get('description');
//         var fileUrl = documents[index].get('fileUrl');
//         var adminName = documents[index].get('Name');
//
//         return Card(
//           margin: EdgeInsets.symmetric(vertical: 8),
//           child: ListTile(
//             title: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(description ?? ''),
//                 SizedBox(height: 8),
//                 Text('Posted By: ${adminName ?? 'Unknown'}'),
//               ],
//             ),
//             subtitle: fileUrl != null ? Container(width: 200, height: 300, child: Image.network(fileUrl)) : null,
//             onTap: () {
//               // Navigate to applied opportunity details page
//               if (fileUrl != null) {
//                 // Open file or show file details
//               } else {
//                 // Navigate or display text details
//               }
//             },
//           ),
//         );
//       },
//       padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
//     );
//   }
//
//
//   Widget _buildToolkitTab() {
//     return GridView.count(
//       padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
//       crossAxisCount: 2,
//       childAspectRatio: 1.0,
//       mainAxisSpacing: 15.0,
//       crossAxisSpacing: 15.0,
//       children: [
//         _buildCubeCard(
//           title: 'Search',
//           icon: Icons.search,
//           onTap: () {
//             // Navigate to search page
//           },
//         ),
//         _buildCubeCard(
//           title: 'Apply',
//           icon: Icons.check_circle,
//           onTap: () {
//             showApplyForm(context, 'My App.', selectedCollege!);  // Call the updated _showApplyForm function
//           },
//         ),
//         _buildCubeCard(
//           title: 'Progress',
//           icon: Icons.show_chart,
//           onTap: () {
//             // Navigate to progress page
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