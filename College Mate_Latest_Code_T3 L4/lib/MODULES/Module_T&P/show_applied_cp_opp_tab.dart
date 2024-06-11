import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ShowAppliedCpOppTab extends StatelessWidget {
  final String selectedCollege;
  final String studentBranch;
  final String studentId;

  ShowAppliedCpOppTab({required this.selectedCollege, required this.studentBranch , required this.studentId });

  @override
  Widget build(BuildContext context) {
    return _buildShowAppliedCpOppTab();
  }

  Widget _buildShowAppliedCpOppTab()  {
    String collectionPath = 'College Mate/Institution/Colleges/$selectedCollege/STUDENT/$studentBranch/Current Students/$studentId/CP Applied Opportunity';

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
}
