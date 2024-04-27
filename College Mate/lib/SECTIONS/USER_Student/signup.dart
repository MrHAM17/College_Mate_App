import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mech_it/MODULES/Module_CollegeProfile/college_about_page.dart';
import 'package:mech_it/MODULES/Module_CollegeProfile/guestscreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../Home/Home_Screen.dart';
import 'login.dart';


class SignUpPage extends StatefulWidget {

   @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();

  TextEditingController registeruseremailController = TextEditingController();
  TextEditingController registeruserpasswordController = TextEditingController();


  String? selectedCollege;
  String? collegeImageUrl;
  // final storage = FirebaseStorage.instance;
  // File logoFile = File("path_to_your_college_logo");

  @override
  void initState() {
    super.initState();
    _getSelectedCollege();
    _fetchCollegeImageUrl();
  }

  _getSelectedCollege() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCollege = prefs.getString('selectedCollege');
    });
  }

  // Fetch the image URL from Firestore
  _fetchCollegeImageUrl() async {
    try {
      if (selectedCollege == null || selectedCollege!.isEmpty) {
        print("Selected college is null or empty");
        return;
      }

      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('College Mate')
          .doc('Institution')
          .collection('Colleges')
          .doc(selectedCollege)
          .get();

      if (snapshot.exists && snapshot.data() != null) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        if (data.containsKey('logo')) {
          setState(() {
            collegeImageUrl = data['logo'] ?? ''; // Use ?? '' to provide a default empty string if 'logo' is null
          });
        } else {
          print("Logo URL not found in Firestore for $selectedCollege");
        }
      } else {
        print("Snapshot does not exist for $selectedCollege");
      }
    } catch (e) {
      print("Error fetching logo URL: $e");
    }
  }





  @override
  void dispose() {
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
                height: size.height / 14,
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
                        child: TextField(
                          controller: registeruseremailController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            fillColor: Colors.white,
                            hintText: 'Enter Email',
                            labelText: 'Enter Email',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat-Bold', fontSize: 17),
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
                      height: size.height * 0.04,
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
                          controller: registeruserpasswordController,
                          cursorColor: Colors.black,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            fillColor: Colors.white,
                            hintText: 'Enter Password',
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
                      height: size.height * 0.04,
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

                        onTap: () async {
                          final registeruseremail = registeruseremailController.text.trim();
                          final registeruserpass = registeruserpasswordController.text.trim();

                          if (   registeruseremail.isEmpty ||  registeruserpass.isEmpty )
                          {
                            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                              content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                children: [  Text('Please fill all details.'),  ],   ),    ),  );
                            return; // Exit the function if any field is empty
                          }

                          try {

                            // Continue with user registration
                            UserCredential registeruserCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword
                              ( email: registeruseremail, password: registeruserpass  );

                            if (registeruserCredential.user != null)
                            {
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

                              // // Allow access to the User section after a delay (you can use a Future.delayed here)
                              // await Future.delayed(Duration(seconds: 9)); // Replace with actual processing time

                              // Registration is successful, now upload the profile image
                              final storage = FirebaseStorage.instance;

                              // Save user all data to Firestore
                              final firestore = FirebaseFirestore.instance;
                              final user = FirebaseAuth.instance.currentUser;

                              // Create reference to the college document
                              // DocumentReference collegeRef = firestore
                              //     .collection('College Mate')
                              //     .doc('Institution')
                              //     .collection('Colleges')
                              //     .doc('Terna Engineering College, Nerul'); // Replace with dynamic college name if needed


                   ////////////

                              // final collegeNameGot = widget.collegeName;
                              // Create reference to the college document using the passed college name
                              // DocumentReference collegeRef = FirebaseFirestore.instance
                              //     .collection('College Mate')
                              //     .doc('Institution')
                              //     .collection('Colleges')
                              //     .doc(widget.collegeName);

                              // Add student data to STUDENT sub-collection
                              // await collegeRef.collection('STUDENT').add({
                              //   'Email': registeruseremail,
                              //   'Password': registeruserpass,
                              //   // Add other user details here...
                              // });

                              await FirebaseFirestore.instance
                                  .collection('College Mate')
                                  .doc('Institution')
                                  .collection('Colleges')
                                  .doc(selectedCollege)
                                  .collection('STUDENT')
                                  .add({
                                'Email': registeruseremail,
                                'Password': registeruserpass,
                                // Add other user details here...
                              });

                              // Show the loading dialog for 2 seconds
                              await Future.delayed(Duration(seconds: 1));

                              // Closing loading indicator
                              Navigator.of(context, rootNavigator: true).pop();  // <-- Close the loading dialog

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );

                            }
                          }
                          on FirebaseAuthException catch (e)
                          {
                            // Closing loading indicator
                            // Navigator.of(context).pop();
                            // Navigator.of(context, rootNavigator: true).pop();  // <-- Close the loading dialog

                            if (e.code == 'email-already-in-use')
                            {
                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                  children: [  Text('The account already exists for that email.'),  ],   ),    ),  );
                            }
                            else if (e.code == 'weak-password')
                            {
                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                  children: [  Text('Password is too weak.'),  ],   ),    ),  );
                            }
                            else
                            {
                              // ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text("If not, then Invalid User's Details."),  ),   );

                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                  children: [  Text("Invalid Email Id"),  ],   ),    ),  );

                              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                content: Row(   mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                                  children: [  Text('Else, fill details correctly.'),  ],   ),    ),  );
                            }
                          }
                          catch (e)
                          {
                            // Navigator.of(context).pop();
                            // Navigator.of(context, rootNavigator: true).pop();  // <-- Close the loading dialog

                            // if (true)
                            // {
                              // ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text('Please fill all details correctly.'),  ),   );
                              // ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text('You are not registered as a "User".'),  ),   );
                              // ScaffoldMessenger.of(context).showSnackBar(   SnackBar(  content: Text("If not, then Invalid User's Details."),  ),   );
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
                                "Sign Up  ",
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
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );                      },
                      child: Text(
                        'Already registered? Login here',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.blue, // Adjust the color as needed
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.11,
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
                                  MaterialPageRoute(builder: (context) => GuestScreen()),
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


















