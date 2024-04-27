// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
//
//
//
// class ShowUpdatesTab extends StatefulWidget {
//   final String selectedCollege;
//   final String studentBranch;
//   final String studentId;
//
//   ShowUpdatesTab({required this.selectedCollege, required this.studentBranch, required this.studentId });
//
//   @override
//   _ShowUpdatesTabState createState() => _ShowUpdatesTabState();
// }
//
// class _ShowUpdatesTabState extends State<ShowUpdatesTab> {
//   // bool showFullDescription = false;
//   late List<bool> showFullDescriptionList;
//
//   @override
//   void initState() {
//     super.initState();
//     showFullDescriptionList = [];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildShowAppliedOppTab();
//   }
//
//   Widget _buildShowAppliedOppTab()  {
//     String collectionPath = 'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA/${widget.studentBranch}/TRAINING & PLACEMENT';
//
//     return FutureBuilder<QuerySnapshot>(
//       future: FirebaseFirestore.instance.collection(collectionPath).get(),
//       builder: (context, snapshot) {
//         // print('Fetching Data...');  // Debugging print
//
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
//         List<QueryDocumentSnapshot> dataDocs = snapshot.data!.docs;
//         showFullDescriptionList = List<bool>.filled(dataDocs.length, false);
//
//         return ListView.builder(
//           itemCount: dataDocs.length,
//           itemBuilder: (context, index) {
//             var post = dataDocs[index];
//             var postData = post.data() as Map<String, dynamic>;
//
//             String description = postData['description'] ?? 'No description';
//             String fileUrl = postData['fileUrl'] ?? '';
//             String adminName = postData['Name'] ?? 'Unknown';
//             Timestamp timestamp = postData['timestamp'] ?? Timestamp.now();
//             DateTime dateTime = timestamp.toDate();
//             String formattedDate = DateFormat('dd/MM/yy').format(dateTime);
//
//             return Container(
//               margin: EdgeInsets.symmetric(vertical: 8),
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Color(0xFFA7B8F3),
//                     Color(0xFF33478A),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.3),
//                     spreadRadius: 1,
//                     blurRadius: 4,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundColor: Colors.grey[300],
//                             child: Icon(
//                               Icons.person,
//                               color: Colors.black87,
//                               size: 20,
//                             ),
//                           ),
//                           SizedBox(width: 8),
//                           Text(
//                             adminName,
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               foreground: Paint()
//                                 ..shader = LinearGradient(
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.topRight,
//                                   colors: [
//                                     Color(0xff1f0b48),
//                                     Color(0xff185a9d),
//                                   ],
//                                 ).createShader(
//                                     Rect.fromLTWH(0, 0, 200, 70)),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         formattedDate,
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black54,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     description,
//                     maxLines: showFullDescriptionList[index] ? null : 3,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.black,
//                     ),
//                   ),
//                   if (description.length > 30)
//                     TextButton(
//                       onPressed: () {
//                         setState(() {
//                           showFullDescriptionList[index] = !showFullDescriptionList[index];
//                         });
//                       },
//                       child: Text(
//                         showFullDescriptionList[index] ? 'Read Less' : 'Read More',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   SizedBox(height: 12),
//                   if (fileUrl.isNotEmpty)
//                     Image.network(
//                       fileUrl,
//                       width: double.infinity,
//                       height: 200,
//                       fit: BoxFit.cover,
//                     ),
//                 ],
//               ),
//             );
//           },
//           padding: EdgeInsets.all(8),
//         );
//       },
//     );
//   }
// }
//
//

















import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';



class ShowUpdatesTab extends StatefulWidget {
  final String selectedCollege;
  final String studentBranch;
  final String studentId;

  ShowUpdatesTab({required this.selectedCollege, required this.studentBranch, required this.studentId });

  @override
  _ShowUpdatesTabState createState() => _ShowUpdatesTabState();
}

class _ShowUpdatesTabState extends State<ShowUpdatesTab> {
  // bool showFullDescription = false;
  // late List<bool> showFullDescriptionList;
  late List<Map<String, dynamic>> postsData;

  @override
  void initState() {
    super.initState();
    // showFullDescriptionList = [];
    postsData = [];
    _fetchData();
  }

  _fetchData() async {
    String collectionPath = 'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA/${widget.studentBranch}/TRAINING & PLACEMENT';
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(collectionPath).get();
    setState(() {
      postsData = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildShowAppliedOppTab();
  }

  Widget _buildShowAppliedOppTab()  {
    if (postsData.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: postsData.length,
      itemBuilder: (context, index) {
        return PostItem(postData: postsData[index]);
      },
      // padding: EdgeInsets.all(8),
    );

    // String collectionPath = 'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA/${widget.studentBranch}/TRAINING & PLACEMENT';
    //
    // return FutureBuilder<QuerySnapshot>(
    //   future: FirebaseFirestore.instance.collection(collectionPath).get(),
    //   builder: (context, snapshot) {
    //     // print('Fetching Data...');  // Debugging print
    //
    //
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //
    //     if (snapshot.hasError) {
    //       return Center(child: Text('\n\n\n\n\n\n\n\n\n\nError fetching data: ${snapshot.error}'));
    //     }
    //
    //     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
    //       return Center(child: Text('\n\n\n\n\n\n\n\n\n\nNo data available', style: TextStyle(fontSize: 18)));
    //     }
    //     List<QueryDocumentSnapshot> dataDocs = snapshot.data!.docs;
    //     showFullDescriptionList = List<bool>.filled(dataDocs.length, false);
    //
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
    //         return Container(
    //           margin: EdgeInsets.symmetric(vertical: 8),
    //           padding: EdgeInsets.all(16),
    //           decoration: BoxDecoration(
    //             gradient: LinearGradient(
    //               begin: Alignment.topLeft,
    //               end: Alignment.bottomRight,
    //               colors: [
    //                 Color(0xFFA7B8F3),
    //                 Color(0xFF33478A),
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
    //                                 Rect.fromLTWH(0, 0, 200, 70)),
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
    //                 description,
    //                 maxLines: showFullDescriptionList[index] ? null : 3,
    //                 overflow: TextOverflow.ellipsis,
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.normal,
    //                   color: Colors.black,
    //                 ),
    //               ),
    //               if (description.length > 30)
    //                 TextButton(
    //                   onPressed: () {
    //                     setState(() {
    //                       showFullDescriptionList[index] = !showFullDescriptionList[index];
    //                     });
    //                   },
    //                   child: Text(
    //                     showFullDescriptionList[index] ? 'Read Less' : 'Read More',
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
    //   },
    // );
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
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFA7B8F3),
            Color(0xFF33478A),
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
                          ],
                        ).createShader(
                            Rect.fromLTWH(0, 0, 200, 70)),
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
            description,
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
