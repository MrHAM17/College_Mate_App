import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'Onboarding_Screen.dart';


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
      appBar: AppBar(
        title: Text('Select Your College'),
        actions: [
          IconButton(
            icon: Icon(Icons.contact_support),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactUsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: CollegeList(),
    );
  }
}

class CollegeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colleges = FirebaseFirestore.instance.collection('colleges').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: colleges,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var college = snapshot.data!.docs[index];
            return ListTile(
              title: Text(college['name']),
              onTap: () async {
                Provider.of<CollegeProvider>(context, listen: false).setCollege(college);

                // var querySnapshot = await FirebaseFirestore.instance
                //     .collection('contactedColleges')
                //     .where('name', isEqualTo: college['name'])
                //     .get();
                //
                // if (querySnapshot.docs.isNotEmpty) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => OnboardingScreen(),
                //     ),
                //   );
                // } else {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ContactUsScreen(),
                //     ),
                //   );
                // }
              },
            );
          },
        );
      },
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

class ContactUsScreen extends StatelessWidget {
  final TextEditingController collegeNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('College Name:'),
            TextField(
              controller: collegeNameController,
              decoration: InputDecoration(
                hintText: 'Enter College Name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // FirebaseFirestore.instance.collection('contactedColleges').add({
                //   'name': collegeNameController.text,
                // });
                //
                // Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
