import 'package:mech_it/SECTIONS/USER_Student/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mech_it/MODULES/Module_CollegeProfile/college_about_page.dart';
import 'package:mech_it/MODULES/Module_CollegeProfile/guestscreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Home/Home_Screen.dart';
import '../USER/SAAS_App_Screen.dart';

class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  List<String> branches = [
    'AIDS',
    'Civil',
    'Computer',
    'EXTC',
    'IT',
    'Mechanic',
    'Mechatronics',
  ];

  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();

  TextEditingController loginuserbranchController = TextEditingController();
  TextEditingController loginuseremailController = TextEditingController();
  TextEditingController loginuserpasswordController = TextEditingController();

  String? selectedCollege;
  String? studentBranch;
  String? studentId;

  // String? collegeImageUrl;

  @override
  void initState() {
    super.initState();
    _getSelectedCollege();
    _getStudentBranch();
    _getStudentId();
  }

  _getSelectedCollege() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCollege = prefs.getString('selectedCollege');
    });
  }

  _getStudentBranch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      studentBranch = prefs.getString('studentBranch');  // Assuming 'studentBranch' is stored as a string in SharedPreferences
    });
  }

  _getStudentId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      studentId = prefs.getString('studentId');  // Assuming 'studentId' is stored as a string in SharedPreferences
    });
  }

  // Fetch the image URL from Firestore
  // _fetchCollegeImageUrl() async {
  //   try {
  //     if (selectedCollege == null || selectedCollege!.isEmpty) {
  //       print("Selected college is null or empty");
  //       return;
  //     }
  //
  //     DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //         .collection('College Mate')
  //         .doc('Institution')
  //         .collection('Colleges')
  //         .doc(selectedCollege)
  //         .get();
  //
  //     if (snapshot.exists && snapshot.data() != null) {
  //       Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
  //       if (data.containsKey('logo')) {
  //         setState(() {
  //           collegeImageUrl = data['logo'] ?? ''; // Use ?? '' to provide a default empty string if 'logo' is null
  //         });
  //       } else {
  //         print("Logo URL not found in Firestore for $selectedCollege");
  //       }
  //     } else {
  //       print("Snapshot does not exist for $selectedCollege");
  //     }
  //   } catch (e) {
  //     print("Error fetching logo URL: $e");
  //   }
  // }

  @override
  void dispose() {
    Firebase.initializeApp();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final size = MediaQuery.of(context).size;
    // ignore: unused_local_variable

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.001,
              ),
              Container(
                child: Image.asset(
                  "assets/images/ternalogo.png",
                  fit: BoxFit.fitWidth,
                ),
                height: size.height / 2.8,
                width: size.width,
              ),
              // Container(
              //   child: collegeImageUrl != null
              //       ? Image.network(
              //     collegeImageUrl!,
              //     fit: BoxFit.fitWidth,
              //   )
              //       : CircularProgressIndicator(), // Show loading indicator until image is fetched
              //   height: size.height / 2.8,
              //   width: size.width,
              // ),

              // const Text(
              //   "Terna Enginnering College, Nerul  ",
              //   style: TextStyle(fontSize: 22, fontFamily: 'Montserrat-Bold'),
              // ),
              Text(
                selectedCollege ?? "No College Selected",
                style: TextStyle(fontSize: 22, fontFamily: 'Montserrat-Bold'),
              ),

              SizedBox(
                // height: size.height / 14,
                // height: 10,
                height: size.height / 21,
              ),
              SizedBox(
                width: size.width * 0.75,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF3BC0F9).withAlpha(90),
                              blurRadius: 15.0,
                              spreadRadius: 2.0,
                              offset: const Offset(
                                10.0,
                                10.0,
                              ),
                            ),
                          ]),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        child: DropdownButtonFormField<String>(
                          value: studentBranch,
                          items: branches.map((String branch) {
                            return DropdownMenuItem<String>(
                              value: branch,
                              child: Text(branch),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              studentBranch = value;
                              loginuserbranchController.text = value!;
                            });
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            hintText: 'Branch',
                            labelText: 'Select Branch',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat-Bold',
                              fontSize: 17,
                            ),
                            suffixIcon: Icon(
                              Icons.email_outlined,
                              size: 25.0,
                              color: Colors.purpleAccent.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      // size.height * 0.04,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF3BC0F9).withAlpha(90),
                              blurRadius: 15.0,
                              spreadRadius: 2.0,
                              offset: const Offset(
                                10.0,
                                10.0,
                              ),
                            ),
                          ]),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        child: TextField(
                          controller: loginuseremailController,
                          cursorColor: Colors.black,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            fillColor: Colors.white,
                            hintText: 'Email',
                            labelText: "Enter Email",
                            hoverColor: Colors.black,
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat-Bold', fontSize: 17),
                            suffixIcon: Icon(
                              Icons.lock_outline,
                              size: 25.0,
                              color: Colors.purpleAccent.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      // size.height * 0.04,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF3BC0F9).withAlpha(90),
                              blurRadius: 15.0,
                              spreadRadius: 2.0,
                              offset: const Offset(
                                10.0,
                                10.0,
                              ),
                            ),
                          ]),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        child: TextField(
                          controller: loginuserpasswordController,
                          cursorColor: Colors.black,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            fillColor: Colors.white,
                            hintText: 'Password',
                            labelText: "Enter Password",
                            hoverColor: Colors.black,
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat-Bold', fontSize: 17),
                            suffixIcon: Icon(
                              Icons.lock_outline,
                              size: 25.0,
                              color: Colors.purpleAccent.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      // size.height * 0.04,
                    ),
                    Container(
                      width: size.width / 3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF3BC0F9).withAlpha(90),
                              blurRadius: 15.0,
                              spreadRadius: 2.0,
                              offset: const Offset(
                                10.0,
                                10.0,
                              ),
                            ),
                          ]),
                      child: InkResponse(
                        splashColor: const Color(0xFFB983FF),
                        radius: size.width / 5,
                        // onTap: () async {
                        //   Navigator.pushReplacement(context,
                        //       MaterialPageRoute(
                        //           builder: (context) => HomeScreen()));
                        // },


                        onTap: () async
                        {
                          final loginuserbranch = loginuserbranchController.text.trim();
                          final loginuseremail = loginuseremailController.text.trim();
                          final loginuserpass =  loginuserpasswordController.text.trim();

                          if (  loginuserbranch.isEmpty || loginuseremail.isEmpty ||  loginuserpass.isEmpty )
                          {
                            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                              content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                children: [  Text('Please fill all details.'),  ],   ),    ),  );

                            return; // Exit the function if any field is empty
                          }

                          try{
                            // Continue with user registration
                            UserCredential loginuserCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword
                              (email: loginuseremail, password: loginuserpass);


                            FirebaseFirestore firestore = FirebaseFirestore.instance;
                            QuerySnapshot userDocs = await firestore
                                .collection('College Mate')
                                .doc('Institution')
                                .collection('Colleges')
                                .doc(selectedCollege)
                                .collection('STUDENT')
                                .doc(studentBranch)
                                .collection('Current Students')
                                // .doc(studentId)
                                .where('Branch', isEqualTo: loginuserbranch)
                                .where('Email', isEqualTo: loginuseremail)
                                .where('Password', isEqualTo: loginuserpass)
                                .limit(1) // Assuming email and password combinations are unique
                                .get();

                            // if (userDocs.docs.isNotEmpty)
                            if (loginuserCredential.user != null  && userDocs.docs.isNotEmpty)
                            {

                              // Save studentId to shared preferences
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setString('studentId', userDocs.docs.first.id);  // Store the document ID
                              prefs.setString('studentBranch', studentBranch!);

                              // Showing loading indicator
                              // showDialog( context: context,   builder: (context){
                              //   return Center(child: CircularProgressIndicator( color: Colors.deepPurple, backgroundColor: Colors.grey) ); },  );
                              showDialog(
                                context: context,
                                builder: (context) => Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.deepPurple,
                                    backgroundColor: Colors.grey,
                                  ),
                                ),
                              );

                              // Allow access to the User section after a delay (you can use a Future.delayed here)
                              // await Future.delayed(Duration(milliseconds: 100)); // Replace with actual processing time

                              // Show the loading dialog for 2 seconds
                              await Future.delayed(Duration(seconds: 1));

                              // Closing loading indicator
                              Navigator.of(context, rootNavigator: true).pop();  // <-- Close the loading dialog

                              // Allow access to the User section
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

                            }
                          }
                          on FirebaseAuthException catch (e)
                          {
                            if (e.code == 'user-not-found')
                            {
                              // print('No user found for that email.');
                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                  children: [  Text('No user found for that email.'),  ],   ),    ),  );

                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                  children: [  Text('Else, You might not registered as a "User".'),  ],   ),    ),  );
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
                                  children: [  Text("Invalid User's Details."),  ],   ),    ),  );

                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                  children: [  Text('Else, You might not registered as a "User".'),  ],   ),    ),  );
                            }
                          }
                          catch (e)
                          {
                            // Navigator.of(context).pop(); // Dismiss the loading indicator
                            // Navigator.of(context, rootNavigator: true).pop();  // <-- Close the loading dialog

                            // if (true)
                            // {
                            //   ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text('Please fill all details correctly.'),  ),   );
                            // }
                            // print(e);
                          }
                        },


                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Login  ",
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(
                                Icons.login,
                                size: 25,
                                color: Colors.purpleAccent.withOpacity(0.4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );                      },
                      child: Text(
                        'New one? Sign Up here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.blue, // Adjust the color as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      // height: size.height * 0.11,
                      height: size.height * 0.09,
                    ),
                    Container(
                      width: size.width * 0.75,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: size.width * 0.9, // Adjust the width as needed
                              height: 50, // Adjust the height as needed
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => GuestScreen(selectedCollege: selectedCollege! )),
                                  );
                                },
                                child:
                                Text(
                                  'View as Guest',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17, // Adjust the size as needed
                                  ),
                                )
                              ),
                            ),
                          ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





