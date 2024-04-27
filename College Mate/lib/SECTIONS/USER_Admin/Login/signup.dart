// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../UTILS/constants/colors.dart';
// import '../Work/upload.dart';
//
// class AdminSignupScreen extends StatefulWidget {
//   @override
//   _AdminSignupScreenState createState() => _AdminSignupScreenState();
// }
//
// class _AdminSignupScreenState extends State<AdminSignupScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//
//   String _selectedRole = 'All';
//   String _selectedBranch = 'AIDS';
//   final _formKey = GlobalKey<FormState>();
//
//   String? selectedCollege;
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
//           'Admin Signup',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         toolbarHeight: 80.0, // Set the height of the AppBar
//
//         backgroundColor: primaryColor,
//         centerTitle: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(15),
//           ),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Card(
//               elevation: 5,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Text(
//                         'Please provide the following details to register as an admin:',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: secondaryColor),
//                       ),
//                       SizedBox(height: 30),
//
//                       _buildTextField('Email', _emailController),
//                       SizedBox(height: 20),
//
//                       _buildTextField('Password', _passwordController, isPassword: true),
//                       SizedBox(height: 20),
//
//                       _buildDropdownButton('Role', _selectedRole, [
//                         'All',
//                         'ATRANG',
//                         'Events',
//                         'Fests',
//                         'NSS',
//                         'REVIVE',
//                         'RESONANCE'
//                       ]),
//                       SizedBox(height: 20),
//
//                       _buildDropdownButton('Branch', _selectedBranch, [
//                         'AIDS',
//                         'Civil',
//                         'Computer',
//                         'EXTC',
//                         'IT',
//                         'Mechanic',
//                         'Mechatronics'
//                       ]),
//                       SizedBox(height: 30),
//
//                       ElevatedButton(
//                         onPressed: () async {
//                           _registerUser();
//                         },
//                         child: Text(
//                           'Signup',
//                           style: TextStyle(color: Colors.white, fontSize: 18),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           primary: primaryColor,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _registerUser() async {
//     if (_formKey.currentState!.validate()) {
//       final registeruseremail = _emailController.text.trim();
//       final registeruserpass = _passwordController.text.trim();
//
//       if (   registeruseremail.isEmpty ||  registeruserpass.isEmpty )
//       {
//         ScaffoldMessenger.of(context).showSnackBar( SnackBar(
//           content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
//             children: [  Text('Please enter email id.'),  ],   ),    ),  );
//         return; // Exit the function if any field is empty
//       }
//
//       try {
//         UserCredential registeruserCredential = await FirebaseAuth
//             .instance
//             .createUserWithEmailAndPassword
//           ( email: registeruseremail, password: registeruserpass  );
//
//         if (registeruserCredential.user != null) {
//           showDialog(
//             context: context,
//             builder: (context) => Center(
//               child: CircularProgressIndicator(
//                 color: primaryColor,
//                 backgroundColor: backgroundColor,
//               ),
//             ),
//           );
//
//           await _firestore
//               .collection('College Mate')
//               .doc('Institution')
//               .collection('Colleges')
//               .doc(selectedCollege)
//               .collection('ADMIN')
//               .add({
//             'Email': registeruseremail,
//             'Password': registeruserpass,
//           });
//
//           // Show the loading dialog for 2 seconds
//           await Future.delayed(Duration(seconds: 1));
//
//           Navigator.of(context, rootNavigator: true).pop();  // <-- Close the loading dialog
//
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => DataUploadScreen()),
//           );
//         }
//       } on FirebaseAuthException catch (e) {
//         // Closing loading indicator
//         // Navigator.of(context, rootNavigator: true).pop();  // <-- Close the loading dialog
//         if (e.code == 'email-already-in-use')
//         {
//           ScaffoldMessenger.of(context).showSnackBar( SnackBar(
//             content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
//               children: [  Text('The account already exists for that email.'),  ],   ),    ),  );
//         }
//         else if (e.code == 'weak-password')
//         {
//           ScaffoldMessenger.of(context).showSnackBar( SnackBar(
//             content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
//               children: [  Text('Password is too weak.'),  ],   ),    ),  );
//         }
//         else
//         {
//           // ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text("If not, then Invalid User's Details."),  ),   );
//
//           ScaffoldMessenger.of(context).showSnackBar( SnackBar(
//             content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
//               children: [  Text("Invalid Email Id"),  ],   ),    ),  );
//
//           ScaffoldMessenger.of(context).showSnackBar( SnackBar(
//             content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
//               children: [  Text('Else, fill details correctly.'),  ],   ),    ),  );
//         }
//
//       } catch (e) {
//         // Navigator.of(context).pop(); // Dismiss the loading indicator
//         // if (true)
//         // {
//         // ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text('Please fill all details correctly.'),  ),   );
//         // ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text('You are not registered as a "User".'),  ),   );
//         // ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text("If not, then Invalid User's Details."),  ),   );
//         // }
//         // print(e);
//       }
//     }
//   }
//
//   Widget _buildTextField(String labelText, TextEditingController controller, {bool isPassword = false}) {
//     return TextFormField(
//       controller: controller,
//       style: TextStyle(fontSize: 16, color: Colors.black), // Set text color to black
//       validator: (value) {
//         if (isPassword && value!.length < 6) {
//           return 'Password must be at least 6 characters long';
//         }
//         return null;
//       },
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle: TextStyle(color: primaryColor),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide(color: secondaryColor, width: 2),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide(color: Colors.grey.shade400),
//         ),
//         filled: true,
//         fillColor: Colors.transparent,
//       ),
//     );
//   }
//
//   Widget _buildDropdownButton(String label, String value, List<String> items) {
//     return DropdownButtonFormField(
//       value: value,
//       items: items
//           .map((item) => DropdownMenuItem(value: item, child: Text(item, style: TextStyle(color: secondaryColor))))
//           .toList(),
//       onChanged: (newValue) {
//         setState(() {
//           if (label == 'Role') {
//             _selectedRole = newValue.toString();
//           } else {
//             _selectedBranch = newValue.toString();
//           }
//         });
//       },
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(),
//         filled: true,
//         fillColor: Colors.transparent,
//       ),
//     );
//   }
// }
















import 'dart:io'; // Import dart:io instead of dart:html
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../UTILS/constants/colors.dart';
import '../Work/upload.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

class AdminSignupScreen extends StatefulWidget {
  @override
  _AdminSignupScreenState createState() => _AdminSignupScreenState();
}

class _AdminSignupScreenState extends State<AdminSignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  File? _profileImage;
  String? _profileImageUrl;

  String _selectedRole = 'TRAINING & PLACEMENT';
  String _selectedBranch = 'All';
  final _formKey = GlobalKey<FormState>();

  String? selectedCollege;

  @override
  void initState() {
    super.initState();
    _getSelectedCollege();
    _setDefaultProfileImage();

  }

  _getSelectedCollege() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCollege = prefs.getString('selectedCollege');
    });
  }

  _setDefaultProfileImage() async {
    try {
      final ByteData defaultImageByteData = await rootBundle.load('assets/images/Admin_Profile.PNG'); // Assuming the default image is in the assets folder
      _profileImage = File.fromRawPath(defaultImageByteData.buffer.asUint8List());
    } catch (e) {
      print('Error loading default profile image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Signup',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        toolbarHeight: 80.0,
        backgroundColor: primaryColor,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Please provide the following details to register as an admin:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: secondaryColor),
                      ),

                      _buildProfileImagePicker(),  // Add the profile image picker
                      SizedBox(height: 20),
                      _buildTextField('Name', _nameController),
                      SizedBox(height: 20),
                      _buildTextField('Phone Number', _phoneController),
                      SizedBox(height: 30),
                      _buildTextField('Email', _emailController),
                      SizedBox(height: 20),
                      _buildTextField('Password', _passwordController, isPassword: true),
                      SizedBox(height: 20),
                      _buildDropdownButton('Category', _selectedRole, [
                        'ANTRANG',
                        'AVALON',
                        'NSS',
                        'REVIVE',
                        'RESONANCE',
                        'SPORTEC',
                        'Events',
                        'FESTS',
                        'IMP',
                        'TRAINING & PLACEMENT'
                      ]),
                      SizedBox(height: 20),
                      _buildDropdownButton('Branch', _selectedBranch, [
                        'All',
                        'AIDS',
                        'Civil',
                        'Computer',
                        'Electronics',
                        'EXTC',
                        'IT',
                        'Mechanic',
                        'Mechatronics'
                      ]),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                          // Save selected admin email to shared preferences
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString('selectedEmailIdForAdmin', _emailController.text.trim());  // Save the admin's email

                          _registerUser();
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildProfileImagePicker() {
    return Column(
      children: [
        Text('Select Profile Photo:'),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            var status = await Permission.storage.request();
            if (status.isGranted) {
              try {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                  allowMultiple: false,
                );

                if (result != null && result.files.isNotEmpty) {
                  _profileImage = File(result.files.single.path!);
                }
              } catch (e) {
                print('Error selecting profile image: $e');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar( content: Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Error selecting photo')], ),   ));
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Permission denied')],
                ),
              ));
            }
          },
          child: Text('Choose Photo'),
        ),
        _profileImage != null ? Text('Photo selected.') : SizedBox.shrink(),
      ],
    );
  }

  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      final registeruseremail = _emailController.text.trim();
      final registeruserpass = _passwordController.text.trim();
      final registeruserName = _nameController.text.trim();
      final registeruserphone = _phoneController.text.trim();

      if (registeruseremail.isEmpty ||
          registeruserpass.isEmpty ||
          registeruserName.isEmpty ||
          registeruserphone.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Please enter all details')],
          ),
        ));
        return;
      }

      try {
        UserCredential registeruserCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: registeruseremail, password: registeruserpass);

        if (registeruserCredential.user != null) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: primaryColor,
                backgroundColor: backgroundColor,
              ),
            ),
          );

          if (_profileImage != null) {
            _profileImageUrl = await _uploadProfileImage(registeruseremail);
          }

          // Get the current timestamp
          DateTime now = DateTime.now();
          String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);


          await _firestore
              .collection('College Mate')
              .doc('Institution')
              .collection('Colleges')
              .doc(selectedCollege)
              .collection('ADMIN')
              .add({
            'ProfilePhotoUrl': _profileImageUrl,
            'Name': registeruserName,
            'Phone': registeruserphone,
            'Email': registeruseremail,
            'Password': registeruserpass,
            'Category': _selectedRole,
            'Branch': _selectedBranch,
            'Timestamp': formattedDate,
          });

          await Future.delayed(Duration(seconds: 1));

          Navigator.of(context, rootNavigator: true).pop();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DataUploadScreen()),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('The account already exists for that email.')],
            ),
          ));
        } else if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Password is too weak.')],
            ),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Invalid Email Id")],
            ),
          ));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Else, fill details correctly.')],
            ),
          ));
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<String> _uploadProfileImage(String email) async {
    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_photos/$email.jpg');

      UploadTask uploadTask = storageReference.putFile(_profileImage!);
      await uploadTask;
      String imageUrl = await storageReference.getDownloadURL();

      return imageUrl;
    } catch (e) {
      print('Error uploading profile image: $e');
      return '';
    }
  }

  Widget _buildTextField(String labelText, TextEditingController controller, {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: 16, color: Colors.black),
      validator: (value) {
        if (isPassword && value!.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: secondaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),
    );
  }

  Widget _buildDropdownButton(String label, String value, List<String> items) {
    return DropdownButtonFormField(
      value: value,
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item, style: TextStyle(color: secondaryColor))))
          .toList(),
      onChanged: (newValue) {
        setState(() {
          if (label == 'Category') {
            _selectedRole = newValue.toString();
          } else {
            _selectedBranch = newValue.toString();
          }
        });
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.transparent,
      ),
    );
  }
}
