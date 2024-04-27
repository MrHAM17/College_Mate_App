import 'dart:io';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';


import 'SECTIONS/USER/College_Selection_Screen.dart';
import 'SECTIONS/USER/Onboarding_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Platform.isAndroid
  //     ?  await Firebase.initializeApp(
  //             options: const FirebaseOptions(
  //             apiKey: "AIzaSyAgonjyXl2jj0Va1fnFii3OPjDMSScRTuk",
  //             appId: "1:962899707976:android:667c1658b25a811861b07d",
  //             messagingSenderId: "962899707976",
  //             projectId: "college-mate-621e8",
  //             ),
  //         )
  //     : await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // home: SAASScreen(),
      home: OnboardingScreen(),

    );
  }
}
