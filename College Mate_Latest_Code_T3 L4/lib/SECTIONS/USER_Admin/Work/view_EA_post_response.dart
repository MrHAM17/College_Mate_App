//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:url_launcher/url_launcher.dart' as launcher;
//
// class ViewEAPostResponsePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Application Summary'),
//         backgroundColor: Colors.deepPurple,
//         elevation: 0, // remove shadow
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildHeader(),
//             SizedBox(height: 20),
//             Expanded(
//               child: _buildViewEAPostResponsePageList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Text(
//       'Companies Applied By Students:',
//       style: TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//         color: Colors.deepPurple,
//       ),
//     );
//   }
//
//   Widget _buildViewEAPostResponsePageList() {
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
//         Map<String, List<Map<String, dynamic>>> companyStudentsMap = _groupStudentsByCompany(snapshot.data!.docs);
//
//         return _buildCompanyListView(companyStudentsMap);
//       },
//     );
//   }
//
//   Widget _buildLoadingIndicator() {
//     return Center(child: CircularProgressIndicator());
//   }
//
//   Widget _buildErrorWidget(String errorMessage) {
//     return Center(child: Text('Error fetching data: $errorMessage', style: TextStyle(color: Colors.red)));
//   }
//
//   Widget _buildNoDataWidget() {
//     return Center(child: Text('No data available', style: TextStyle(color: Colors.grey)));
//   }
//
//   Map<String, List<Map<String, dynamic>>> _groupStudentsByCompany(List<QueryDocumentSnapshot> docs) {
//     Map<String, List<Map<String, dynamic>>> companyStudentsMap = {};
//
//     docs.forEach((doc) {
//       var data = doc.data() as Map<String, dynamic>;
//       String companyName = data['companyName'] ?? 'Unknown Company';
//       String studentName = data['studentName'] ?? 'Unknown Student';
//       String studentEmail = data['studentEmail'] ?? 'Unknown Email';
//       String resumeUrl = data['resumeUrl'] ?? '';
//
//       Map<String, dynamic> studentDetails = {
//         'name': studentName,
//         'email': studentEmail,
//         'resumeUrl': resumeUrl,
//       };
//
//       companyStudentsMap.putIfAbsent(companyName, () => []).add(studentDetails);
//     });
//
//     return companyStudentsMap;
//   }
//
//   Widget _buildCompanyListView(Map<String, List<Map<String, dynamic>>> companyStudentsMap) {
//     return ListView.builder(
//       itemCount: companyStudentsMap.length,
//       itemBuilder: (context, index) {
//         String companyName = companyStudentsMap.keys.toList()[index];
//         List<Map<String, dynamic>> students = companyStudentsMap.values.toList()[index];
//
//         return _buildCompanyCard(companyName, students, context); // Pass context here
//       },
//     );
//   }
//
//   Widget _buildCompanyCard(String companyName, List<Map<String, dynamic>> students, BuildContext context) {
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
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         subtitle: Text('${students.length} students applied', style: TextStyle(fontSize: 16)),
//         children: students.map((student) => _buildStudentTile(context, student)).toList(),
//         trailing: Icon(Icons.arrow_forward_ios),
//       ),
//     );
//   }
//
//   Widget _buildStudentTile(BuildContext context, Map<String, dynamic> student) {
//     return ListTile(
//       title: Text(student['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       subtitle: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Email: ${student['email']}', style: TextStyle(fontSize: 16)),
//             ],
//           ),
//           if (student['resumeUrl'].isNotEmpty)
//             ElevatedButton.icon(
//               onPressed: () async {
//                 if (await launcher.canLaunch(student['resumeUrl']!)) {
//                   await launcher.launch(student['resumeUrl']!);
//                 } else {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('Error'),
//                         content: Text('Could not open the resume.'),
//                         actions: <Widget>[
//                           TextButton(
//                             child: Text('OK'),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               },
//               icon: Icon(Icons.file_download),
//               label: Text('View Resume'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.deepPurple,
//                 textStyle: TextStyle(fontSize: 6),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }


















import 'package:flutter/material.dart';

class ViewEAPostResponsePage extends StatelessWidget {
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
        child: Center(
          child: Text(
            'This feature is currently unavailable for you.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}


