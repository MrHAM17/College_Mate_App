

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mech_it/UTILS/constants/colors.dart';
import 'package:mech_it/UTILS/imageview/imageViewer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'apply_opp.dart';
import 'package:intl/intl.dart';


class CampusPlacementScreen extends StatefulWidget {
  String role;
  CampusPlacementScreen({Key? key, required this.role}) : super(key: key);

  @override
  _CampusPlacementScreenState createState() => _CampusPlacementScreenState();
}

class _CampusPlacementScreenState extends State<CampusPlacementScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String selectedCategory;
  late String selectedBranch;
  String? selectedCollege;
  String? studentId;  // Define studentId here



  _getSelectedCollege() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCollege = prefs.getString('selectedCollege');
      // print('Selected College: $selectedCollege');  // Debugging print
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
    _getSelectedCollege();
    _getStudentId();  // Fetch studentId
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

  // Widget _buildTabView(String tabName) {
  //
  //   // String civilTrainingPlacements = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Civil/TRAINING & PLACEMENT';
  //   String computerTrainingPlacements = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/TRAINING & PLACEMENT';
  //
  //   return FutureBuilder<List<QuerySnapshot>>(
  //     future: Future.wait([
  //       // FirebaseFirestore.instance.collection(civilTrainingPlacements).get(),
  //       FirebaseFirestore.instance.collection(computerTrainingPlacements).get(),
  //     ]),
  //     builder: (context, AsyncSnapshot<List<QuerySnapshot>> snapshot) {
  //       print('Fetching Data...');  // Debugging print
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       }
  //
  //       if (snapshot.hasError) {
  //         print('Error fetching data: ${snapshot.error}');
  //         return Center(child: Text('Error fetching data: ${snapshot.error}'));
  //       }
  //
  //       if (!snapshot.hasData ||
  //           snapshot.data!.isEmpty ||
  //           snapshot.data![0].docs.isEmpty ||
  //           snapshot.data![1].docs.isEmpty) {
  //         return Center(child: Text('No data available'));
  //       }
  //
  //       List<QueryDocumentSnapshot> dataDocs1 = snapshot.data![0].docs;
  //       List<QueryDocumentSnapshot> dataDocs2 = snapshot.data![1].docs;
  //
  //       List<QueryDocumentSnapshot> combinedDataDocs = [...dataDocs1, ...dataDocs2];
  //
  //       print('Fetched ${combinedDataDocs.length} documents');
  //
  //       switch (tabName) {
  //         case 'Updates':
  //           print('Building Updates Tab with ${combinedDataDocs.length} documents');  // Debugging print
  //           return _buildUpdatesNoticesTab(combinedDataDocs);
  //         case 'My App.':
  //           print('Building My App Tab with ${combinedDataDocs.length} documents');  // Debugging print
  //           return _buildAppliedOpportunitiesTab(combinedDataDocs);
  //         case 'My Toolkit':
  //           print('Building My Toolkit Tab');  // Debugging print
  //           return _buildToolkitTab();
  //         default:
  //           return Center(child: Text('Invalid Tab'));
  //       }
  //     },
  //   );
  // }
  Widget _buildTabView(String tabName) {
    String collectionName = 'TRAINING & PLACEMENT';  // Default collection name
    String collectionPath = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/NSS/TRAINING & PLACEMENT';

    // String collectionName = 'NSS';  // Default collection name
    // if (tabName == 'Updates') {
    //   collectionName = 'DATA';
    // }

    // String collectionPath1 = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/AVALON';
    String collectionPath2 = 'College Mate/Institution/Colleges/$selectedCollege/DATA/Computer/NSS/TRAINING & PLACEMENT';



    return FutureBuilder<QuerySnapshot>(
      // future: FirebaseFirestore.instance.collection(collectionPath1).get(),
      // future: FirebaseFirestore.instance.collection(collectionPath2).get(),

      future: FirebaseFirestore.instance
          .collection('College Mate')
          .doc('Institution')
          .collection('Colleges')
          .doc(selectedCollege)
          .collection('DATA')
          .doc('Computer')
          .collection(collectionName)
          .get(),
      builder: (context, snapshot) {
        print('Fetching Data...');  // Debugging print
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          print('Error fetching data: ${snapshot.error}');
          return Center(child: Text('Error fetching data: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No data available'));
        }

        // snapshot.connectionState == ConnectionState.done;

        List<QueryDocumentSnapshot> dataDocs = snapshot.data!.docs;

        print('Fetched ${dataDocs.length} documents');


        switch (tabName) {
          case 'Updates':
            print('Building Updates Tab with ${dataDocs.length} documents');  // Debugging print
            return _buildUpdatesNoticesTab(dataDocs);
          case 'My App.':
            print('Building My App Tab with ${dataDocs.length} documents');  // Debugging print
            return _buildAppliedOpportunitiesTab();
          case 'My Toolkit':
            print('Building My Toolkit Tab');  // Debugging print
            return _buildToolkitTab();
          default:
            return Center(child: Text('Invalid Tab'));
        }
      },
    );
  }



  // Widget _buildUpdatesNoticesTab(List<QueryDocumentSnapshot> dataDocs) {
  //   return ListView.builder(
  //     itemCount: dataDocs.length,
  //     itemBuilder: (context, index) {
  //       var post = dataDocs[index];
  //       var postData = post.data() as Map<String, dynamic>;
  //
  //       String description = postData['description'] ?? 'No description';
  //       String fileUrl = postData['fileUrl'] ?? '';
  //       String adminName = postData['Name'] ?? 'Unknown';
  //
  //       return Container(
  //         margin: EdgeInsets.symmetric(vertical: 8),
  //         padding: EdgeInsets.all(8),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(12),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey.withOpacity(0.5),
  //               spreadRadius: 2,
  //               blurRadius: 5,
  //               offset: Offset(0, 3),
  //             ),
  //           ],
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               description,
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.black,
  //               ),
  //             ),
  //             SizedBox(height: 12),
  //             Text(
  //               'Posted By: $adminName',
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.w600,
  //                 color: Colors.grey[600],
  //               ),
  //             ),
  //             SizedBox(height: 12),
  //             fileUrl.isNotEmpty
  //                 ? Image.network(
  //               fileUrl,
  //               width: double.infinity,
  //               height: 200,
  //               fit: BoxFit.cover,
  //             )
  //                 : SizedBox.shrink(),
  //           ],
  //         ),
  //       );
  //     },
  //     padding: EdgeInsets.all(8),
  //   );
  // }
  ///////////////////////////////////////////////////////////////////////////
  // Widget _buildUpdatesNoticesTab(List<QueryDocumentSnapshot> dataDocs) {
  //   return ListView.builder(
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
  //       String formattedDate = DateFormat('dd/MM/yy HH:mm').format(dateTime);
  //
  //       bool showFullDescription = false;
  //
  //       return Container(
  //         margin: EdgeInsets.symmetric(vertical: 8),
  //         padding: EdgeInsets.all(12),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(12),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey.withOpacity(0.5),
  //               spreadRadius: 2,
  //               blurRadius: 5,
  //               offset: Offset(0, 3),
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
  //                     Icon(
  //                       Icons.account_circle,
  //                       color: Colors.grey[600],
  //                       size: 24,
  //                     ),
  //                     SizedBox(width: 8),
  //                     Text(
  //                       adminName,
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.grey[600],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Text(
  //                   formattedDate,
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                     color: Colors.grey[600],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: 12),
  //             Text(
  //               showFullDescription ? description : truncateDescription(description),
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.black,
  //               ),
  //             ),
  //             if (description.length > 100)
  //               TextButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     showFullDescription = !showFullDescription;
  //                   });
  //                 },
  //                 child: Text(
  //                   showFullDescription ? 'Read Less' : 'Read More',
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w600,
  //                     color: Colors.blue,
  //                   ),
  //                 ),
  //               ),
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
  //     padding: EdgeInsets.all(8),
  //   );
  // }
  // String truncateDescription(String description) {
  //   if (description.length > 100) {
  //     return description.substring(0, 100) + '...';
  //   }
  //   return description;
  // }
  /////////////////////////////////////////////////////////////////////////////
  // Widget _buildUpdatesNoticesTab(List<QueryDocumentSnapshot> dataDocs) {
  //   return ListView.builder(
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
  //       bool showFullDescription = false;
  //
  //       return Container(
  //         margin: EdgeInsets.symmetric(vertical: 8),
  //         padding: EdgeInsets.all(16),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
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
  //                         color: Colors.grey[600],
  //                         size: 20,
  //                       ),
  //                     ),
  //                     SizedBox(width: 8),
  //                     Text(
  //                       adminName,
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.grey[800],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Text(
  //                   formattedDate,
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w400,
  //                     color: Colors.grey[600],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: 12),
  //             Text(
  //               showFullDescription ? description : truncateDescription(description),
  //               maxLines: showFullDescription ? null : 3,
  //               overflow: TextOverflow.ellipsis,
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.w500,
  //                 color: Colors.black,
  //               ),
  //             ),
  //             if (description.length > 100)
  //               TextButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     showFullDescription = !showFullDescription;
  //                   });
  //                 },
  //                 child: Text(
  //                   showFullDescription ? 'Read Less' : 'Read More',
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w600,
  //                     color: Colors.blue,
  //                   ),
  //                 ),
  //               ),
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
  //     padding: EdgeInsets.all(8),
  //   );
  // }
  // String truncateDescription(String description) {
  //   if (description.length > 100) {
  //     return description.substring(0, 100) + '...';
  //   }
  //   return description;
  // }
  Widget _buildUpdatesNoticesTab(List<QueryDocumentSnapshot> dataDocs) {
    return ListView.builder(
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




  // Widget _buildAppliedOpportunitiesTab(List<QueryDocumentSnapshot> dataDocs) {
  //   return ListView.builder(
  //     itemCount: dataDocs.length,
  //     itemBuilder: (context, index) {
  //       var post = dataDocs[index];
  //       var postData = post.data() as Map<String, dynamic>;
  //
  //       String companyName = postData['companyName'] ?? 'No Company Name';
  //       String jobRole = postData['jobRole'] ?? 'No Job Role';
  //       String jobLocation = postData['jobLocation'] ?? 'No Job Location';
  //       String jobDescription = postData['jobDescription'] ?? 'No Job Description';
  //       Timestamp timestamp = postData['timestamp'] ?? Timestamp.now();
  //
  //       DateTime dateTime = timestamp.toDate();
  //       String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  //
  //       return Card(
  //         elevation: 5.0,
  //         margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 companyName,
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               SizedBox(height: 8),
  //               Text(
  //                 'Job Role: $jobRole',
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               SizedBox(height: 8),
  //               Text(
  //                 'Job Location: $jobLocation',
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               SizedBox(height: 8),
  //               Text(
  //                 'Job Description: $jobDescription',
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               SizedBox(height: 8),
  //               Text(
  //                 'Applied On: $formattedDate',
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  Widget _buildAppliedOpportunitiesTab()  {
    String collectionPath = 'College Mate/Institution/Colleges/$selectedCollege/STUDENT/$studentId/Applied Opportunity';

    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection(collectionPath).get(),
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

        return ListView.builder(
          itemCount: dataDocs.length,
          itemBuilder: (context, index) {
            var post = dataDocs[index];
            var postData = post.data() as Map<String, dynamic>;

            String companyName = postData['companyName'] ?? 'No Company Name';
            String jobRole = postData['jobRole'] ?? 'No Job Role';
            String jobLocation = postData['jobLocation'] ?? 'No Job Location';
            String jobDescription = postData['jobDescription'] ?? 'No Job Description';
            Timestamp timestamp = postData['timestamp'] ?? Timestamp.now();

            DateTime dateTime = timestamp.toDate();
            String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

            return Card(
              elevation: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFA7B8F3), // Lighter blue
                      Color(0xFF33478A), // Darker blue
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20), // Same value as the card's border radius
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        companyName,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Role: $jobRole',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Location: $jobLocation',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Description: $jobDescription',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Applied On: $formattedDate',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
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
            if (studentId != null) {
              // ApplyFormPage(tabName: 'My App.', selectedCollege: selectedCollege!, studentId: studentId!,);  // Call the updated _showApplyForm function
              Navigator.push( context, MaterialPageRoute( builder: (context) => ApplyFormPage(
                  tabName: 'My App.', selectedCollege: selectedCollege!, studentId: studentId! ),  ),   );
            }
            // else {
            //   // Handle the case where studentId is null
            //   print('studentId is null');
            // }

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