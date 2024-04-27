// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void showApplyForm(BuildContext context, String tabName, String selectedCollege) {
//   String postId = FirebaseFirestore.instance
//       .collection('College Mate')
//       .doc('Institution')
//       .collection('Colleges')
//       .doc(selectedCollege)
//       .collection('DATA')
//       .doc(tabName)
//       .id;
//
//   TextEditingController companyNameController = TextEditingController();
//   TextEditingController jobRoleController = TextEditingController();
//   TextEditingController jobLocationController = TextEditingController();
//   TextEditingController jobDescriptionController = TextEditingController();
//
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add this line
//
//   showModalBottomSheet(
//     isScrollControlled: true,
//     context: context,
//     builder: (BuildContext context) {
//       return SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey, // Assign the form key here
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Apply for Placement Opportunity',
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 TextFormField(
//                   controller: companyNameController,
//                   decoration: InputDecoration(labelText: 'Company Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter company name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 10.0),
//                 TextFormField(
//                   controller: jobRoleController,
//                   decoration: InputDecoration(labelText: 'Job Role'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter job role';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 10.0),
//                 TextFormField(
//                   controller: jobLocationController,
//                   decoration: InputDecoration(labelText: 'Job Location'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter job location';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 10.0),
//                 TextFormField(
//                   controller: jobDescriptionController,
//                   decoration: InputDecoration(labelText: 'Job Description'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter job description';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20.0),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) { // Use the form key here
//                       await FirebaseFirestore.instance
//                           .collection('College Mate')
//                           .doc('Institution')
//                           .collection('Colleges')
//                           .doc(selectedCollege)
//                           .collection('STUDENT')
//                           .doc()
//                           .collection('AppliedOpp')
//                           .doc(postId)
//                           .set({
//                         'companyName': companyNameController.text,
//                         'jobRole': jobRoleController.text,
//                         'jobLocation': jobLocationController.text,
//                         'jobDescription': jobDescriptionController.text,
//                       });
//
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }











import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Declare GlobalKey outside the function
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

void showApplyForm(BuildContext context, String tabName, String selectedCollege) {
  String postId = FirebaseFirestore.instance
      .collection('College Mate')
      .doc('Institution')
      .collection('Colleges')
      .doc(selectedCollege)
      .collection('DATA')
      .doc(tabName)
      .id;

  TextEditingController companyNameController = TextEditingController();
  TextEditingController jobRoleController = TextEditingController();
  TextEditingController jobLocationController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Assign the form key here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Apply for Placement Opportunity',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: companyNameController,
                  decoration: InputDecoration(labelText: 'Company Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter company name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: jobRoleController,
                  decoration: InputDecoration(labelText: 'Job Role'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter job role';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: jobLocationController,
                  decoration: InputDecoration(labelText: 'Job Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter job location';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: jobDescriptionController,
                  decoration: InputDecoration(labelText: 'Job Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter job description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) { // Use the form key here
                      await FirebaseFirestore.instance
                          .collection('College Mate')
                          .doc('Institution')
                          .collection('Colleges')
                          .doc(selectedCollege)
                          .collection('STUDENT')
                          .doc('UWkHXji3pK5kJWpzVstu') // Add specific user ID here
                          .collection('AppliedOpp')
                          .doc(postId)
                          .set({
                        'companyName': companyNameController.text,
                        'jobRole': jobRoleController.text,
                        'jobLocation': jobLocationController.text,
                        'jobDescription': jobDescriptionController.text,
                      });

                      Navigator.pop(context); // Close the modal bottom sheet
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
