//
//
////  ////////////////////        Version ---->>> 1 ( all mix)
//
//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:url_launcher/url_launcher.dart' as launcher;
//
// class ViewCPPostResponsePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Application Summary',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xff43cea2),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(25),
//           ),
//         ),
//         toolbarHeight: 80.0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 10),
//             Expanded(
//               child: _buildViewCPPostResponsePageList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildViewCPPostResponsePageList() {
//     return FutureBuilder<QuerySnapshot>(
//       future: FirebaseFirestore.instance.collectionGroup('CP Applied Opportunity').get(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return _buildLoadingIndicator();
//         }
//
//         if (snapshot.hasError) {
//           return _buildErrorWidget(snapshot.error.toString());
//         }
//
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return _buildNoDataWidget();
//         }
//
//         return _buildApplicationListView(snapshot.data!.docs);
//       },
//     );
//   }
//
//   Widget _buildLoadingIndicator() {
//     return Center(child: CircularProgressIndicator());
//   }

//   Widget _buildErrorWidget(String errorMessage) {
//     return Center(child: Text('Error fetching data: $errorMessage', style: TextStyle(color: Colors.red)));
//   }
//
//   Widget _buildNoDataWidget() {
//     return Center(child: Text('No data available', style: TextStyle(color: Colors.grey)));
//   }
//
//   Widget _buildApplicationListView(List<QueryDocumentSnapshot> docs) {
//     Map<String, List<Map<String, dynamic>>> groupedApplications = {};
//
//     docs.forEach((doc) {
//       var data = doc.data() as Map<String, dynamic>;
//       String companyName = data['companyName'] ?? 'Unknown Company';
//       String applicantName = data['applicantName'] ?? 'Unknown Applicant';
//       String applicantEmail = data['applicantEmail'] ?? 'Unknown Email';
//       String resumeUrl = data['resumeUrl'] ?? '';
//       Timestamp timestamp = data['timestamp'] ?? Timestamp.now();
//
//       Map<String, dynamic> application = {
//         'applicantName': applicantName,
//         'applicantEmail': applicantEmail,
//         'resumeUrl': resumeUrl,
//         'timestamp': timestamp,
//       };
//
//       if (groupedApplications.containsKey(companyName)) {
//         groupedApplications[companyName]!.add(application);
//       } else {
//         groupedApplications[companyName] = [application];
//       }
//     });
//
//     return ListView.builder(
//       itemCount: groupedApplications.length,
//       itemBuilder: (context, index) {
//         String companyName = groupedApplications.keys.toList()[index];
//         List<Map<String, dynamic>> applications = groupedApplications.values.toList()[index];
//
//         return _buildCompanyCard(companyName, applications, context);
//       },
//     );
//   }
//
//   Widget _buildCompanyCard(String companyName, List<Map<String, dynamic>> applications, BuildContext context) {
//     Timestamp timestamp = applications.first['timestamp'];
//     String formattedDate = '${timestamp.toDate().day}-${timestamp.toDate().month}-${timestamp.toDate().year}';
//
//     return Card(
//       elevation: 4.0,
//       margin: EdgeInsets.symmetric(vertical: 10),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: ExpansionTile(
//         title: Text(
//           companyName,
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//             color: Colors.blueAccent,
//           ),
//         ),
//         subtitle: Text('Company No: $formattedDate', style: TextStyle(fontSize: 18, color: Colors.grey)),
//         children: applications.map((application) => _buildApplicationTile(application, context, applications.indexOf(application) + 1)).toList(),
//       ),
//     );
//   }
//
//   Widget _buildApplicationTile(Map<String, dynamic> application, BuildContext context, int serialNumber) {
//     String applicantName = application['applicantName'];
//     String applicantEmail = application['applicantEmail'];
//     String resumeUrl = application['resumeUrl'];
//
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundColor: Colors.blueAccent,
//         radius: 16,
//         child: Text(
//           '$serialNumber',
//           style: TextStyle(fontSize: 14, color: Colors.white),
//         ),
//       ),
//       title: Text(
//         applicantName,
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//       subtitle: Text(
//         applicantEmail,
//         style: TextStyle(fontSize: 16),
//       ),
//       trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
//       onTap: () async {
//         if (resumeUrl.isNotEmpty) {
//           if (await launcher.canLaunch(resumeUrl)) {
//             await launcher.launch(resumeUrl);
//           } else {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text('Error'),
//                   content: Text('Could not open the resume.'),
//                   actions: <Widget>[
//                     TextButton(
//                       child: Text('OK'),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         } else {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text('No Resume Available'),
//                 content: Text('The applicant has not provided a resume URL.'),
//                 actions: <Widget>[
//                   TextButton(
//                     child: Text('OK'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//       },
//     );
//   }
//
// }











//  ////////////////////        Version ---->>> 2 (all ok(seprate data for respective admin ) only all students not visible under same company --> if all applay for same --> minute issue)




//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:url_launcher/url_launcher.dart' as launcher;
//
// class ViewCPPostResponsePage extends StatelessWidget {
//   final String selectedCollege;
//   final String selectedBranch;
//
//   ViewCPPostResponsePage({
//     required this.selectedCollege,
//     required this.selectedBranch,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Application Summary',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xff43cea2),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(25),
//           ),
//         ),
//         toolbarHeight: 80.0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: _buildViewCPPostResponsePageList(),
//       ),
//     );
//   }
//
//   Widget _buildViewCPPostResponsePageList() {
//     return FutureBuilder<QuerySnapshot>(
//       future: FirebaseFirestore.instance
//           .collection('College Mate')
//           .doc('Institution')
//           .collection('Colleges')
//           .doc(selectedCollege)
//           .collection('STUDENT')
//           .doc(selectedBranch)
//           .collection('Current Students')
//           .get(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return _buildLoadingIndicator();
//         }
//
//         if (snapshot.hasError) {
//           return _buildErrorWidget(snapshot.error.toString());
//         }
//
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return _buildNoDataWidget();
//         }
//
//         return _buildStudentListView(snapshot.data!.docs);
//       },
//     );
//   }
//
//   Widget _buildStudentListView(List<QueryDocumentSnapshot> studentDocs) {
//     return ListView.builder(
//       itemCount: studentDocs.length,
//       itemBuilder: (context, index) {
//         String studentId = studentDocs[index].id;
//         return FutureBuilder<QuerySnapshot>(
//           future: FirebaseFirestore.instance
//               .collection('College Mate')
//               .doc('Institution')
//               .collection('Colleges')
//               .doc(selectedCollege)
//               .collection('STUDENT')
//               .doc(selectedBranch)
//               .collection('Current Students')
//               .doc(studentId)
//               .collection('CP Applied Opportunity')
//               .get(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return _buildLoadingIndicator();
//             }
//
//             if (snapshot.hasError) {
//               return _buildErrorWidget(snapshot.error.toString());
//             }
//
//             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return SizedBox.shrink();  // Return an empty SizedBox if no data
//             }
//
//             // Process and display the posts for the student
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Text(
//                 //   'Student ID: $studentId',  // Display the student ID
//                 //   style: TextStyle(
//                 //     fontSize: 20,
//                 //     fontWeight: FontWeight.bold,
//                 //   ),
//                 // ),
//                 // SizedBox(height: 10),
//                 _buildApplicationListView(snapshot.data!.docs),
//                 // SizedBox(height: 20),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildApplicationListView(List<QueryDocumentSnapshot> docs) {
//     Map<String, List<Map<String, dynamic>>> groupedApplications = {};
//
//     docs.forEach((doc) {
//       var data = doc.data() as Map<String, dynamic>;
//       String companyName = data['companyName'] ?? 'Unknown Company';
//       String applicantName = data['applicantName'] ?? 'Unknown Applicant';
//       String applicantEmail = data['applicantEmail'] ?? 'Unknown Email';
//       String resumeUrl = data['resumeUrl'] ?? '';
//       Timestamp timestamp = data['timestamp'] ?? Timestamp.now();
//
//       Map<String, dynamic> application = {
//         'applicantName': applicantName,
//         'applicantEmail': applicantEmail,
//         'resumeUrl': resumeUrl,
//         'timestamp': timestamp,
//       };
//
//       if (groupedApplications.containsKey(companyName)) {
//         groupedApplications[companyName]!.add(application);
//       } else {
//         groupedApplications[companyName] = [application];
//       }
//     });
//
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: groupedApplications.length,
//       itemBuilder: (context, index) {
//         String companyName = groupedApplications.keys.toList()[index];
//         List<Map<String, dynamic>> applications = groupedApplications.values.toList()[index];
//
//         return _buildCompanyCard(companyName, applications, context);
//       },
//     );
//   }
//
//   Widget _buildCompanyCard(String companyName, List<Map<String, dynamic>> applications, BuildContext context) {
//     Timestamp timestamp = applications.first['timestamp'];
//     String formattedDate = '${timestamp.toDate().day}-${timestamp.toDate().month}-${timestamp.toDate().year}';
//
//     return Card(
//       elevation: 4.0,
//       margin: EdgeInsets.symmetric(vertical: 10),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: ExpansionTile(
//         title: Text(
//           companyName,
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//             color: Colors.blueAccent,
//           ),
//         ),
//         subtitle: Text('Company No: $formattedDate', style: TextStyle(fontSize: 18, color: Colors.grey)),
//         children: applications.map((application) => _buildApplicationTile(application, context, applications.indexOf(application) + 1)).toList(),
//       ),
//     );
//   }
//
//   Widget _buildApplicationTile(Map<String, dynamic> application, BuildContext context, int serialNumber) {
//     String applicantName = application['applicantName'];
//     String applicantEmail = application['applicantEmail'];
//     String resumeUrl = application['resumeUrl'];
//
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundColor: Colors.blueAccent,
//         radius: 16,
//         child: Text(
//           '$serialNumber',
//           style: TextStyle(fontSize: 14, color: Colors.white),
//         ),
//       ),
//       title: Text(
//         applicantName,
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//       subtitle: Text(
//         applicantEmail,
//         style: TextStyle(fontSize: 16),
//       ),
//       trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
//       onTap: () async {
//         if (resumeUrl.isNotEmpty) {
//           if (await launcher.canLaunch(resumeUrl)) {
//             await launcher.launch(resumeUrl);
//           } else {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text('Error'),
//                   content: Text('Could not open the resume.'),
//                   actions: <Widget>[
//                     TextButton(
//                       child: Text('OK'),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         } else {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text('No Resume Available'),
//                 content: Text('The applicant has not provided a resume URL.'),
//                 actions: <Widget>[
//                   TextButton(
//                     child: Text('OK'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//       },
//     );
//   }
//
//   Widget _buildLoadingIndicator() {
//     return Center(
//         // child: CircularProgressIndicator()
//     );
//   }
//
//   Widget _buildErrorWidget(String errorMessage) {
//     return Center(child: Text('Error fetching data: $errorMessage', style: TextStyle(color: Colors.red)));
//   }
//
//   Widget _buildNoDataWidget() {
//     return Center(child: Text('No data available', style: TextStyle(color: Colors.grey)));
//   }
// }









//  ////////////////////        Version ---->>> 3 ( all specific & under same company if there ) --> all solved

















import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ViewCPPostResponsePage extends StatelessWidget {
  final String selectedCollege;
  final String selectedBranch;

  ViewCPPostResponsePage({
    required this.selectedCollege,
    required this.selectedBranch,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Application Summary',
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
        toolbarHeight: 80.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // child: _buildViewCPPostResponsePageList(),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Expanded(
                  child: _buildViewCPPostResponsePageList(),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildViewCPPostResponsePageList() {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('College Mate')
          .doc('Institution')
          .collection('Colleges')
          .doc(selectedCollege)
          .collection('STUDENT')
          .doc(selectedBranch)
          .collection('Current Students')
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingIndicator();
        }

        if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error.toString());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return _buildNoDataWidget();
        }

        return _buildStudentListView(snapshot.data!.docs);
      },
    );
  }


  Widget _buildStudentListView(List<QueryDocumentSnapshot> studentDocs) {
    return FutureBuilder<Map<String, List<Map<String, dynamic>>>>(
      future: _groupApplicationsByCompany(studentDocs),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingIndicator();
        }

        if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error.toString());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return _buildNoDataWidget();
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            String companyName = snapshot.data!.keys.toList()[index];
            List<Map<String, dynamic>> applications = snapshot.data!.values.toList()[index];

            return _buildCompanyCard(companyName, applications, context);
          },
        );
      },
    );
  }

  Future<Map<String, List<Map<String, dynamic>>>> _groupApplicationsByCompany(List<QueryDocumentSnapshot> studentDocs) async {
    Map<String, List<Map<String, dynamic>>> groupedApplications = {};

    for (var studentDoc in studentDocs) {
      var snapshot = await studentDoc.reference.collection('CP Applied Opportunity').get();

      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        String companyName = data['companyName'] ?? 'Unknown Company';
        String applicantName = data['applicantName'] ?? 'Unknown Applicant';
        String applicantEmail = data['applicantEmail'] ?? 'Unknown Email';
        String resumeUrl = data['resumeUrl'] ?? '';
        Timestamp timestamp = data['timestamp'] ?? Timestamp.now();

        Map<String, dynamic> application = {
          'applicantName': applicantName,
          'applicantEmail': applicantEmail,
          'resumeUrl': resumeUrl,
          'timestamp': timestamp,
        };

        if (groupedApplications.containsKey(companyName)) {
          groupedApplications[companyName]!.add(application);
        } else {
          groupedApplications[companyName] = [application];
        }
      }
    }

    return groupedApplications;
  }

  Widget _buildCompanyCard(String companyName, List<Map<String, dynamic>> applications, BuildContext context) {
    Timestamp timestamp = applications.first['timestamp'];
    String formattedDate = '${timestamp.toDate().day}-${timestamp.toDate().month}-${timestamp.toDate().year}';

    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ExpansionTile(
        title: Text(
          companyName,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        subtitle: Text('Company No: $formattedDate', style: TextStyle(fontSize: 18, color: Colors.grey)),
        // children: applications.map((application) => _buildApplicationTile(application, context)).toList(),
        children: applications.map((application) {
          int serialNumber = applications.indexOf(application) + 1;
          return _buildApplicationTile(application, context, serialNumber);
        }).toList(),
      ),
    );
  }

  Widget _buildApplicationTile(Map<String, dynamic> application, BuildContext context,  int serialNumber) {
    String applicantName = application['applicantName'];
    String applicantEmail = application['applicantEmail'];
    String resumeUrl = application['resumeUrl'];

    return ListTile(
        leading: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        radius: 16,
        child: Text(
          '$serialNumber',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
      title: Text(
        applicantName,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        applicantEmail,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
      onTap: () async {
        if (resumeUrl.isNotEmpty) {
          if (await launcher.canLaunch(resumeUrl)) {
            await launcher.launch(resumeUrl);
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('Could not open the resume.'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('No Resume Available'),
                content: Text('The applicant has not provided a resume URL.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      // child: CircularProgressIndicator()
    );
  }

  Widget _buildErrorWidget(String errorMessage) {
    return Center(child: Text('Error fetching data: $errorMessage', style: TextStyle(color: Colors.red)));
  }

  Widget _buildNoDataWidget() {
    return Center(child: Text('No data available', style: TextStyle(color: Colors.grey)));
  }
}
