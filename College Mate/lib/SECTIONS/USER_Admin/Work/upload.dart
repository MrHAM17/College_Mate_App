// import 'dart:io'; // Add this import
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class DataUploadScreen extends StatefulWidget { // Define the DataUploadScreen class here
//   @override
//   _DataUploadScreenState createState() => _DataUploadScreenState();
// }
//
// class _DataUploadScreenState extends State<DataUploadScreen> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController _dataController = TextEditingController();
//
//   String _selectedCategory = 'Training & Placement Cell';
//   File? _selectedFile;
//   String? _fileName;
//   String? selectedCollege;
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _getSelectedCollege();
//   }
//
//   _getSelectedCollege() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       selectedCollege = prefs.getString('selectedCollege');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Admin Panel',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         toolbarHeight: 80.0,
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(15),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Card(
//           elevation: 5,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   DropdownButtonFormField<String>(
//                     value: _selectedCategory,
//                     items: [
//                       'Training & Placement Cell',
//                       'Notice & Events',
//                       'Updates, News & Messages'
//                     ]
//                         .map((category) => DropdownMenuItem(
//                       child: Text(category),
//                       value: category,
//                     ))
//                         .toList(),
//                     decoration: InputDecoration(labelText: 'Select Category'),
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedCategory = value!;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   _buildFilePicker(),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: _dataController,
//                     decoration: InputDecoration(labelText: 'Enter Description (Optional)'),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         uploadData();
//                       }
//                     },
//                     child: Text('Upload Data'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildFilePicker() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Select File to Upload:'),
//         SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: () async {
//             FilePickerResult? result = await FilePicker.platform.pickFiles(
//               type: FileType.custom,
//               allowedExtensions: ['jpg', 'jpeg', 'png'],
//             );
//
//             if (result != null) {
//               _selectedFile = File(result.files.single.path!);
//               _fileName = _selectedFile!.path.split('/').last;
//             }
//           },
//           child: Text('Choose File'),
//         ),
//         _fileName != null ? Text('Selected File: $_fileName') : SizedBox.shrink(),
//       ],
//     );
//   }
//
//   Future<void> uploadData() async {
//     try {
//       showDialog(
//         context: context,
//         builder: (context) => Center(
//           child: CircularProgressIndicator(
//             color: Colors.deepPurple,
//             backgroundColor: Colors.grey,
//           ),
//         ),
//       );
//
//       String folderName = 'DATA';
//
//       // Create a unique ID for the document
//       String postId = _firestore.collection(folderName).doc().id;
//
//       String? fileUrl;
//
//       // If a file is selected, upload file to Firebase Storage and get download URL
//       if (_selectedFile != null) {
//         Reference storageReference = FirebaseStorage.instance
//             .ref()
//             .child('$folderName/$_selectedCategory/$postId/$_fileName');
//         UploadTask uploadTask = storageReference.putFile(_selectedFile!);
//         await uploadTask.whenComplete(() => null);
//         fileUrl = await storageReference.getDownloadURL();
//       }
//
//       // Set data in Firestore
//       await _firestore
//           .collection('College Mate')
//           .doc('Institution')
//           .collection('Colleges')
//           .doc(selectedCollege)
//           .collection('DATA')
//           .doc(postId)
//           .set({
//         'fileUrl': fileUrl,  // This will be null if no file is uploaded
//         'fileName': _fileName,  // This will be null if no file is uploaded
//         'description': _dataController.text,
//         'timestamp': Timestamp.now(),
//         'category': _selectedCategory,
//       });
//
//
//       // Show the loading dialog for 2 seconds
//       await Future.delayed(Duration(seconds: 1));
//
//       // Closing loading indicator
//       // Navigator.of(context).pop();
//       Navigator.of(context, rootNavigator: true).pop();  // <-- Close the loading dialog
//
//       ScaffoldMessenger.of(context).showSnackBar( SnackBar(
//         content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
//           children: [  Text('Data uploaded successfully'),  ],   ),    ),  );
//
//       _dataController.clear();
//       _selectedFile = null;
//       _fileName = null;
//     } catch (e) {
//       // Print the error message to the console
//       print('Error uploading data: $e');
//
//       // Show an error message to the user
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to upload data. Error: $e')),
//       );
//     }
//   }
//
//
//   @override
//   void dispose() {
//     _dataController.dispose();
//     super.dispose();
//   }
// }










import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mech_it/SECTIONS/USER_Admin/Login/login.dart';
import 'package:mech_it/SECTIONS/USER_Admin/Login/signup.dart';

class DataUploadScreen extends StatefulWidget {
  @override
  _DataUploadScreenState createState() => _DataUploadScreenState();
}

class _DataUploadScreenState extends State<DataUploadScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _dataController = TextEditingController();

  String _selectedCategory = 'Training & Placement Cell';
  File? _selectedFile;
  String? _fileName;
  String? selectedCollege;
  String? adminName;
  String? adminCategory;
  String? adminBranch;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _getSelectedCollege();
    _getAdminDetails();

  }

  _getSelectedCollege() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCollege = prefs.getString('selectedCollege');
    });
  }

  _getAdminDetails() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? adminEmail = prefs.getString('selectedEmailIdForAdmin');

        FirebaseFirestore firestore = FirebaseFirestore.instance;
        QuerySnapshot userDocs = await firestore
            .collection('College Mate')
            .doc('Institution')
            .collection('Colleges')
            .doc(selectedCollege)
            .collection('ADMIN')
            .where('Email', isEqualTo: user.email)
        .where('Branch')
        .where('Name')
        .where('Category')
            .limit(1)
            .get();

        if (userDocs.docs.isNotEmpty) {
          setState(() {
            adminBranch = userDocs.docs[0]['Branch'];
            adminName = userDocs.docs[0]['Name'];
            adminCategory = userDocs.docs[0]['Category'];
            _selectedCategory = adminCategory ?? 'Training & Placement Cell';  // Update the selected category based on adminRole

          });
        } else {
          throw 'Admin details not found';
        }
      } catch (e) {
        print('Error fetching admin details: $e');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Panel',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        toolbarHeight: 80.0,
        backgroundColor: Colors.blue,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          color: Colors.deepPurpleAccent,  // Changed card background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(  // Added border side for better contrast
              color: Colors.green,
              width: 5.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),  // Disable scrolling of the whole page
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAdminDetails(),  // Display admin details
                    SizedBox(height: 30),
                    // DropdownButtonFormField<String>(
                    //   value: _selectedCategory,
                    //   items: [
                    //     'Training & Placement Cell',
                    //     'Notice & Events',
                    //     'Updates, News & Messages'
                    //   ]
                    //       .map((category) => DropdownMenuItem(
                    //     child: Text(category),
                    //     value: category,
                    //   ))
                    //       .toList(),
                    //   decoration: InputDecoration(labelText: 'Select Category'),
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _selectedCategory = value!;
                    //     });
                    //   },
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please select a category';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(height: 20),
                    // _buildRoleDropdown(),  // Display dropdown to select role
                    // SizedBox(height: 20),
                    _buildFilePicker(),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: _dataController,
                      maxLines: null,  // Allows for unlimited lines
                      // scrollPhysics: AlwaysScrollableScrollPhysics(),  // Enables scrolling
                      // expands: true,   // Enables the text field to grow vertically
                      decoration: InputDecoration(
                        labelText: 'Enter Description',
                        labelStyle: TextStyle(color: Colors.white),  // Changed label color
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 4.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     if (_formKey.currentState!.validate()) {
                    //
                    //       _showConfirmationDialog();
                    //       // uploadData();
                    //     }
                    //   },
                    //   child: Text('Post',
                    //       style: TextStyle(fontSize: 14),  // Increased button text size
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     primary: Colors.blue,  // Changed button color
                    //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    //
                    // ),
                    // SizedBox(height: 20),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     _resetForm();
                    //   },
                    //   child: Text(
                    //     'Reset',
                    //     style: TextStyle(fontSize: 14),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     primary: Colors.red,
                    //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    // )

                    Row( // Row to place the buttons side by side
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _resetForm();
                          },
                          child: Text(
                            'Reset',
                            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _showConfirmationDialog();
                              // uploadData();
                            }
                          },
                          child: Text(
                            'Post',
                            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Upload ?'),
          content: Text('Are you sure you want to upload this data?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Post'),
              onPressed: () {
                Navigator.of(context).pop();
                uploadData();
              },
            ),
          ],
        );
      },
    );
  }




  // Widget _buildRoleDropdown() {
  //   return DropdownButtonFormField<String>(
  //     value: adminRole,
  //     items: [
  //       adminRole!,  // Show only the selected role
  //     ].map((role) => DropdownMenuItem(
  //       child: Text(role),
  //       value: role,
  //     )).toList(),
  //     decoration: InputDecoration(labelText: 'Select Role'),
  //     onChanged: (value) {
  //       setState(() {
  //         adminRole = value!;
  //       });
  //     },
  //     validator: (value) {
  //       if (value == null || value.isEmpty) {
  //         return 'Please select a role';
  //       }
  //       return null;
  //     },
  //   );
  // }

  Widget _buildAdminDetails() {
    if (adminName == null || adminCategory == null || adminBranch == null) {
      // If admin details are not available yet, show a loading indicator or return an empty container
      // return Center(child: CircularProgressIndicator());
    }

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Admin Category:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                '$adminCategory',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Admin Name:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                '$adminName',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Admin Branch:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                '$adminBranch',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  // Widget _buildFilePicker() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text('Select File to Upload:'),
  //       SizedBox(height: 10),
  //       ElevatedButton(
  //         onPressed: () async {
  //           FilePickerResult? result = await FilePicker.platform.pickFiles(
  //             type: FileType.custom,
  //             allowedExtensions: ['jpg', 'jpeg', 'png'],
  //           );
  //
  //           if (result != null) {
  //             _selectedFile = File(result.files.single.path!);
  //             _fileName = _selectedFile!.path.split('/').last;
  //             setState(() {}); // Refresh the UI to display the selected file name
  //
  //           }
  //         },
  //         child: Text('Choose File'),
  //       ),
  //       _fileName != null ? Text('Selected File: $_fileName') : SizedBox.shrink(),
  //     ],
  //   );
  // }

  Widget _buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Center(
        //   child: Text(
        //     'Select File to Upload:',
        //     style: TextStyle(
        //       fontSize: 18,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        SizedBox(height: 12),
        Center(
          child: ElevatedButton.icon(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'jpeg', 'png'],
              );

              if (result != null) {
                _selectedFile = File(result.files.single.path!);
                _fileName = _selectedFile!.path.split('/').last;
                setState(() {}); // Refresh the UI to display the selected file name
              }
            },
            icon: Icon(Icons.file_upload, size: 20),
            label: Text(
              'Choose File',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        _fileName != null
            ? Center(
              child: Text(
                        'Selected File: $_fileName',
                        style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
                        ),
                      ),
            )
            : SizedBox.shrink(),
      ],
    );
  }


  Future<void> uploadData() async {
    try {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurple,
            backgroundColor: Colors.white,
          ),
        ),
      );

      if (adminName == null || adminCategory == null) {
        throw 'Admin details not available';
      }

      String folderName = 'DATA';

      String postId = _firestore.collection(folderName).doc().id;

      String? fileUrl;



      if (_selectedFile != null) {
        Reference storageReference = FirebaseStorage.instance
            .ref()
            .child('College Mate/Institution/Colleges/$selectedCollege/$folderName/$adminBranch/$_selectedCategory/$_fileName');
        UploadTask uploadTask = storageReference.putFile(_selectedFile!);
        await uploadTask.whenComplete(() => null);
        fileUrl = await storageReference.getDownloadURL();
      }


      await _firestore
          .collection('College Mate')
          .doc('Institution')
          .collection('Colleges')
          .doc(selectedCollege)
          .collection('DATA')
          .doc(adminBranch)
          .collection(_selectedCategory)
          .doc(postId)
          .set({
        'Name': adminName,
        'Branch': adminBranch,
        'fileUrl': fileUrl,
        'fileName': _fileName,
        'description': _dataController.text,
        'timestamp': Timestamp.now(),
        'category': _selectedCategory,
      });

      if (true) {
        // Reset selected image and its name after successful upload
        _dataController.clear();
        _selectedFile = null;
        _fileName = null;
      }

      await Future.delayed(Duration(seconds: 1));

      Navigator.of(context, rootNavigator: true).pop();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Done')],
        ),
      ));

      _dataController.clear();
      _selectedFile = null;
      _fileName = null;

    } catch (e) {
      print('Error uploading data: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload data. Error: $e')),
      );
    }
  }


  void _resetForm() {
    _dataController.clear();
    _selectedFile = null;
    _fileName = null;
    setState(() {});
  }


  @override
  void dispose() {
    _dataController.dispose();
    super.dispose();
  }
}
