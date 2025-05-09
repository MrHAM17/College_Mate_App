

//  //////////////////////////////////////////////////////////    version 1


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../Work/upload_post.dart';
//
// class AdminLoginScreen extends StatefulWidget {
//   @override
//   _AdminLoginScreenState createState() => _AdminLoginScreenState();
// }
//
// class _AdminLoginScreenState extends State<AdminLoginScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   TextEditingController loginuseremailController = TextEditingController();
//   TextEditingController loginuserpasswordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   String? selectedCollege;
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
//           'Admin Login',
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
//         toolbarHeight: 80.0, // Set the height of the AppBar
//       ),
//
//       body: Container(
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Card(
//               elevation: 8.0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Form(
//                   key: _formKey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         TextFormField(
//                           controller: loginuseremailController,
//                           decoration: InputDecoration(
//                             labelText: 'Email',
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             prefixIcon: Icon(Icons.email, color: Color(0xff43cea2)),
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                           validator: (value) => value!.isEmpty ? 'Email is required' : null,
//                         ),
//                         SizedBox(height: 20.0),
//                         TextFormField(
//                           controller: loginuserpasswordController,
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             prefixIcon: Icon(Icons.lock, color: Color(0xff43cea2)),
//                           ),
//                           obscureText: true,
//                           validator: (value) => value!.isEmpty ? 'Password is required' : null,
//                         ),
//                         SizedBox(height: 30.0),
//                         ElevatedButton(
//                           onPressed: () async
//                           {
//                             final loginuseremail = loginuseremailController.text.trim();
//                             final loginuserpass =  loginuserpasswordController.text.trim();
//
//                             try
//                             {
//
//                               FirebaseFirestore firestore = FirebaseFirestore.instance;
//                               QuerySnapshot userDocs = await firestore
//                                   .collection('College Mate')
//                                   .doc('Institution')
//                                   .collection('Colleges')
//                                   .doc(selectedCollege)
//                                   .collection('ADMIN')
//                                   .where('Email', isEqualTo: loginuseremail)
//                                   .where('Password', isEqualTo: loginuserpass)
//                                   .limit(1) // Assuming email and password combinations are unique
//                                   .get();
//
//                               if (userDocs.docs.isNotEmpty)
//                               {
//                                 // Showing loading indicator
//                                 showDialog( context: context,   builder: (context){
//                                   return Center(child: CircularProgressIndicator( color: Colors.deepPurpleAccent, backgroundColor: Colors.grey, value: 0.75) ); },  );
//
//                                 // Allow access to the User section after a delay (you can use a Future.delayed here)
//                                 await Future.delayed(Duration(milliseconds: 100)); // Replace with actual processing time
//
//                                 // Closing loading indicator
//                                 Navigator.of(context).pop();
//
//                                 // Allow access to the User section
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) => DataUploadScreen()));
//
//                               }
//                               else
//                               {
//                                 // Closing loading indicator
//                                 Navigator.of(context).pop();
//
//                                 ScaffoldMessenger.of(context).showSnackBar( SnackBar(
//                                   content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
//                                     children: [  Text('You are not registered as a "User".'),  ],   ),    ),  );
//
//                                 ScaffoldMessenger.of(context).showSnackBar( SnackBar(
//                                   content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
//                                     children: [  Text("Otherwise, Invalid User's Details."),  ],   ),     ),   );
//
//
//                                 // UserCredential loginuserCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: loginuseremail, password: loginuserpass);
//                                 // if(loginuserCredential.user != null)
//                                 // {
//                                 //   ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text('You are not registered as a "User".'),  ),   );
//                                 //   ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text("If not, then Invalid User's Details."),  ),   );
//                                 // }
//                               }
//
//                             }
//                             on FirebaseAuthException catch (e)
//                             {
//                               if (e.code == 'user-not-found')
//                               { print('No user found for that email.');   }
//                               else if (e.code == 'wrong-password')
//                               { print('Wrong password provided for that user.');   }
//                               else
//                               {  print('Error: $e');
//                               }
//                               // Handle other authentication errors here
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             primary: Color(0xff43cea2),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(vertical: 15.0),
//                             child: Text(
//                               'Login',
//                               style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





//  //////////////////////////////////////////////////////////    version 2





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../UTILS/constants/colors.dart';
import '../Work/college_admin_home_screen.dart';
import '../Work/upload_post.dart';

class AdminLoginScreen extends StatefulWidget {
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController loginadminemailController = TextEditingController();
  TextEditingController loginadminpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? selectedCollege;
  String? selectedBranch = null;
  String? selectedRole = null;


  _getSelectedCollege() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCollege = prefs.getString('selectedCollege');
    });
  }

  // _getSelectedBranch() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     selectedBranch = prefs.getString('selectedBranch');
  //   });
  // }
  //
  // _getSelectedCategory() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     selectedRole = prefs.getString('selectedCategory');
  //   });
  // }
  @override
  void initState() {
    super.initState();
    _getSelectedCollege();
    // _getSelectedBranch();
    // _getSelectedCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Login',
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
        toolbarHeight: 80.0, // Set the height of the AppBar
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // _buildDropdownButton('Branch', selectedBranch ?? 'All', [
                        //   'All',
                        //   'AIDS',
                        //   'Civil',
                        //   'Computer',
                        //   'Electronics',
                        //   'EXTC',
                        //   'IT',
                        //   'Mechanic',
                        //   'Mechatronics'
                        // ]),
                        // SizedBox(height: 20.0),
                        // _buildDropdownButton('Category', selectedRole ?? 'ANTRANG', [
                        //   'ANTRANG',
                        //   'AVALON',
                        //   'NSS',
                        //   'REVIVE',
                        //   'RESONANCE',
                        //   'SPORTEC',
                        //   'Events',
                        //   'FESTS',
                        //   'IMP',
                        //   'TRAINING & PLACEMENT'
                        // ]),
                        //
                        // SizedBox(height: 20.0),
                        TextFormField(
                          controller: loginadminemailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            prefixIcon: Icon(Icons.email, color: Color(0xff43cea2)),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => value!.isEmpty ? 'Email is required' : null,
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: loginadminpasswordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            prefixIcon: Icon(Icons.lock, color: Color(0xff43cea2)),
                          ),
                          obscureText: true,
                          validator: (value) => value!.isEmpty ? 'Password is required' : null,
                        ),
                        SizedBox(height: 30.0),
                        ElevatedButton(
                          onPressed: () async
                          {
                            // Save selected admin email to shared preferences
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString('selectedEmailIdForAdmin', loginadminemailController.text.trim());  // Save the admin's email


                            final loginuseremail = loginadminemailController.text.trim();
                            final loginuserpass = loginadminpasswordController.text.trim();

                            if (   loginuseremail.isEmpty ||  loginuserpass.isEmpty )
                            {
                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                  children: [  Text('Please fill all details.'),  ],   ),    ),  );

                              return; // Exit the function if any field is empty
                            }

                            try {
                              UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                                email: loginuseremail,
                                password: loginuserpass,
                              );

                              showDialog(
                                context: context,
                                builder: (context) => Center(
                                  child: CircularProgressIndicator(
                                    color: primaryColor,
                                    backgroundColor: backgroundColor,
                                  ),
                                ),
                              );

                              // FirebaseFirestore firestore = FirebaseFirestore.instance;
                              // QuerySnapshot userDocs = await firestore
                              //     .collection('College Mate')
                              //     .doc('Institution')
                              //     .collection('Colleges')
                              //     .doc(selectedCollege)
                              //     .collection('ADMIN')
                              //     .where('Branch', isEqualTo: selectedBranch)
                              //     .where('Category', isEqualTo: selectedRole)
                              //     .where('Email', isEqualTo: loginuseremail)
                              //     .where('Password', isEqualTo: loginuserpass)
                              //     .limit(1) // Assuming email and password combinations are unique
                              //     .get();
                              //
                              // // if (userDocs.docs.isNotEmpty)
                              // if (userCredential.user != null)
                              // {
                              //   // Allow access to the User section after a delay (you can use a Future.delayed here)
                              //   // await Future.delayed(Duration(milliseconds: 100)); // Replace with actual processing time
                              //
                              //   // Show the loading dialog for 2 seconds
                              //   await Future.delayed(Duration(seconds: 1));
                              //
                              //   // Closing loading indicator
                              //   Navigator.of(context, rootNavigator: true).pop();  // <-- Close the loading dialog
                              //
                              //   print("////////////////////////////////////") ;
                              //   print(selectedBranch) ;
                              //   print(selectedRole) ;
                              //
                              //   // Allow access to the User section
                              //   // Navigator.push(context, MaterialPageRoute(builder: (context) => DataUploadScreen()));
                              //   Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeAdminHomeScreen(selectedCollege,selectedBranch, selectedRole)));
                              //
                              // }


                              if (userCredential.user != null) {
                                FirebaseFirestore firestore = FirebaseFirestore.instance;
                                DocumentSnapshot adminDoc = await firestore
                                    .collection('College Mate')
                                    .doc('Institution')
                                    .collection('Colleges')
                                    .doc(selectedCollege)
                                    .collection('ADMIN')
                                    .doc(loginuseremail) // Assuming email is the document ID for admins
                                    // .limit(1) // Assuming email and password combinations are unique
                                    .get();

                                if (adminDoc.exists)
                                {
                                  //   // Allow access to the User section after a delay (you can use a Future.delayed here)
                                  //   // await Future.delayed(Duration(milliseconds: 100)); // Replace with actual processing time
                                  //
                                    // Show the loading dialog for 2 seconds
                                    await Future.delayed(Duration(seconds: 1));

                                  setState(() {
                                    selectedBranch = adminDoc.get('Branch');
                                    selectedRole = adminDoc.get('Category');
                                  });

                                    // Closing loading indicator
                                    Navigator.of(context, rootNavigator: true).pop();  // <-- Close the loading dialog

                                  //   print("////////////////////////////////////") ;
                                  //   print(selectedBranch) ;
                                  //   print(selectedRole) ;

                                  Navigator.push( context, MaterialPageRoute( builder: (context) => CollegeAdminHomeScreen(
                                        selectedCollege,
                                        selectedBranch,
                                        selectedRole,
                                      ),
                                    ),
                                  );
                                }

                                // print("////////////////////////////////////") ;
                                // print(selectedBranch) ;
                                // print(selectedRole) ;

                              }


                            }
                            on FirebaseAuthException catch (e)
                            {
                              if (e.code == 'user-not-found')
                              {
                                // print('No user found for that email.');
                                ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                  content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                    children: [  Text('No admin found for that email.'),  ],   ),    ),  );

                                ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                  content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                    children: [  Text('Else, You might not registered as a "Admin".'),  ],   ),    ),  );
                              }
                              else if (e.code == 'wrong-password')
                              {
                                // print('Wrong password provided for that user.');
                                ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                  content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                    children: [  Text('Wrong password.'),  ],   ),    ),  );
                              }
                              else
                              {
                                // ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text('Please fill all details correctly.'),  ),   );

                                ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                  content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                    children: [  Text("Invalid Admin's Details."),  ],   ),    ),  );

                                ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                  content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                    children: [  Text('Else, You might not registered as a "Admin".'),  ],   ),    ),  );
                              }
                            }
                            catch (e)
                            {
                              // Navigator.of(context, rootNavigator: true).pop();  // <-- Close the loading dialog
                              // if (true)
                              // {
                              //   ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text('Please fill all details correctly.'),  ),   );
                              // }
                              // print(e);
                            }
                          },


                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff43cea2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
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
      ),
    );
  }

  Widget _buildDropdownButton(String label, String? value, List<String> items) {
    return DropdownButtonFormField(
      value: value ?? items.first, // Use the first item as a default if value is null
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item, style: TextStyle(color: secondaryColor))))
          .toList(),
      onChanged: (newValue) {
        setState(() {
          if (label == 'Category') {
            selectedRole = newValue.toString();
          } else {
            selectedBranch = newValue.toString();
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


// class ForgotPasswordScreen extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Forgot Password',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xff43cea2),
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Enter your email to reset password',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _submitEmail(context);
//               },
//               child: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 primary: Color(0xff43cea2),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _submitEmail(BuildContext context) {
//     // TODO: Implement your forgot password logic here
//     final email = _emailController.text;
//
//     // Here you can add logic to send a password reset email to the user
//     // For now, we'll just print the email to the console
//     print('Email submitted: $email');
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Password reset link sent to $email'),
//       ),
//     );
//   }
// }
