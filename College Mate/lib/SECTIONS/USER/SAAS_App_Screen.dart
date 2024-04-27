// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';
//
// import 'Onboarding_Screen.dart';
// import 'contact_for_service.dart';
//
// class SAASScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => CollegeProvider(),
//       child: MaterialApp(
//         title: 'College Management App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: CollegeSelectionScreen(),
//       ),
//     );
//   }
// }
//
// class CollegeSelectionScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: EdgeInsets.all(16.0),
//         children: [
//           SizedBox(height: 16),
//
//           // Advertising Section
//           Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.0),
//                 gradient: LinearGradient(
//                   colors: [Colors.blue[200]!, Colors.blue[100]!],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Welcome to Our\n'
//                             'College Management App!',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[900]),
//                       ),
//                       SizedBox(height: 25),
//                       Text(
//                         'Streamline your college management with our comprehensive app.\n'
//                             'Contact us to add your college or proceed with an existing one.',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 16, color: Colors.blue[800]),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//           SizedBox(height: 16),
//           // Select Your College Option Card
//           Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             child: InkWell(
//               borderRadius: BorderRadius.circular(15.0),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ContactUsScreen(),
//                   ),
//                 );
//               },
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Center(
//                   child: Text(
//                     'Connect with Our Service',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[900]),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//
//           // Proceed Option Card
//           Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             child: InkWell(
//               borderRadius: BorderRadius.circular(15.0),
//               onTap: () {
//                 // TODO: Implement logic to proceed with an existing college
//               },
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Center(
//                   child: Text(
//                     'Proceed with Your College',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[900]),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//           SizedBox(height: 16),
//           // College List
//           Consumer<CollegeProvider>(
//             builder: (context, collegeProvider, child) {
//               return CollegeList();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CollegeList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final colleges = FirebaseFirestore.instance.collection('colleges').snapshots();
//
//     return StreamBuilder<QuerySnapshot>(
//       stream: colleges,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return CircularProgressIndicator();
//
//         return ListView.builder(
//           shrinkWrap: true,
//           itemCount: snapshot.data!.docs.length,
//           itemBuilder: (context, index) {
//             var college = snapshot.data!.docs[index];
//             return Card(
//               elevation: 2,
//               child: ListTile(
//                 title: Text(college['name']),
//                 onTap: () async {
//                   Provider.of<CollegeProvider>(context, listen: false).setCollege(college);
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
//
// class CollegeProvider extends ChangeNotifier {
//   late DocumentSnapshot _college;
//
//   DocumentSnapshot get college => _college;
//
//   void setCollege(DocumentSnapshot college) {
//     _college = college;
//     notifyListeners();
//   }
// }
//
















import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'connect_to_institute.dart';
import 'contact_for_service.dart';

class SAASScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CollegeProvider(),
      child: MaterialApp(
        title: 'College Management App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CollegeSelectionScreen(),
      ),
    );
  }
}

class CollegeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SizedBox(height: 16),

          // Advertising Section
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  colors: [Colors.blue[200]!, Colors.blue[100]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to Our\n'
                            'College Management App!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[900]),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Streamline your college management with our comprehensive app.\n'
                            'Contact us to add your college or proceed with an existing one.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 95),
          // Select Your College Option Card
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUsScreen(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Connect with Our Service',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[900]),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),

          // Proceed Option Card
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InstitutionListScreen(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Proceed with Your College',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[900]),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class CollegeProvider extends ChangeNotifier {
  late DocumentSnapshot _college;

  DocumentSnapshot get college => _college;

  void setCollege(DocumentSnapshot college) {
    _college = college;
    notifyListeners();
  }
}
