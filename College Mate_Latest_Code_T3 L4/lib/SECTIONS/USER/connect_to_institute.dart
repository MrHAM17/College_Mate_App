// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';
//
// import '../Home/Onboarding_Screen.dart';
// import 'SAAS_App_Screen.dart';
// import 'contact_for_service.dart';
//
// class InstitutionListScreen extends StatefulWidget {
//   @override
//   _InstitutionListScreenState createState() => _InstitutionListScreenState();
// }
//
// class _InstitutionListScreenState extends State<InstitutionListScreen> {
//   late TextEditingController _searchController;
//   late Stream<QuerySnapshot> _institutionsStream;
//
//   @override
//   void initState() {
//     super.initState();
//     _searchController = TextEditingController();
//     _institutionsStream = FirebaseFirestore.instance.collection('Institutions').snapshots(); // Corrected collection name
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Select Your Institution',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         elevation: 5,
//         backgroundColor: Colors.blue,
//         shape: ContinuousRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(40),
//             bottomRight: Radius.circular(40),
//           ),
//         ),
//       ),
//
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 36),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 prefixIcon: Icon(Icons.search, color: Colors.grey),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: BorderSide(color: Colors.blue, width: 2),
//                 ),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _institutionsStream = FirebaseFirestore.instance.collection('Institution')
//                       .where('name', isGreaterThanOrEqualTo: value)
//                       .where('name', isLessThanOrEqualTo: value + '\uf8ff')
//                       .snapshots();
//                 });
//               },
//             ),
//           ),
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _institutionsStream,
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
//
//                 return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     var institution = snapshot.data!.docs[index];
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                       child: Card(
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         child: ListTile(
//                           title: Text(
//                             institution['name'],
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
//                           ),
//                           trailing: Icon(Icons.arrow_forward, color: Colors.blue),
//                           onTap: () {
//                             Provider.of<CollegeProvider>(context, listen: false).setCollege(institution);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => OnboardingScreen(),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home/Onboarding_Screen.dart';
import 'SAAS_App_Screen.dart';
import 'contact_for_service.dart';

class InstitutionListScreen extends StatefulWidget {
  @override
  _InstitutionListScreenState createState() => _InstitutionListScreenState();
}

class _InstitutionListScreenState extends State<InstitutionListScreen> {
  late TextEditingController _searchController;
  late Stream<QuerySnapshot> _institutionsStream;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _institutionsStream = FirebaseFirestore.instance.collection('College Mate').doc('Institution').collection('Colleges').snapshots();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Your Institution',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.blue,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _institutionsStream = FirebaseFirestore.instance
                      .collection('College Mate')
                      .doc('Institution')
                      .collection('Colleges')
                      .where('name', isGreaterThanOrEqualTo: value.toUpperCase())
                      .where('name', isLessThanOrEqualTo: value.toUpperCase() + '\uf8ff')
                      .snapshots();
                });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _institutionsStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var college = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          title: Text(
                            college['name'],
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                          trailing: Icon(Icons.arrow_forward, color: Colors.blue),
                          onTap: () async {
                            // Provider.of<CollegeProvider>(context, listen: false).setCollege(college);

                            // Save selected college name to shared preferences
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString('selectedCollege', college['name']);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OnboardingScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
