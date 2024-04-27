import 'package:college_mate/SECTIONS/USER_Student/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:college_mate/MODULES/Module_CollegeProfile/college_about_page.dart';
import 'package:college_mate/MODULES/Module_CollegeProfile/guestscreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../USER/Home_Screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
              const Text(
                "Terna Enginnering College, Nerul  ",
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
                          controller: email,
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
                          controller: password,
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
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
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





