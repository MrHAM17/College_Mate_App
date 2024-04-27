import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:college_mate/SECTIONS/Login/login.dart';
import 'package:college_mate/SECTIONS/MainScreen.dart';

import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var token = sharedPreferences.getString('token');
  var opened = sharedPreferences.getBool('opened');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (token == null
          ? opened == null
              ? MyApp()
          : LoginPage()
          : MainScreen(role: 'role')),
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // Insert your function here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Color(0xffd8e8e5),
        showNextButton: false,
        done: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Text('Done'),
        ),
        onDone: () => {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginPage(key: key)))

        },
        pages: [firstscreen(), secondscreen(), thirdscreen()],
      ),
    );
  }

  PageViewModel firstscreen() {
    Size size = MediaQuery.of(context).size;
    return PageViewModel(
        title: 'Welcome',
        decoration: PageDecoration(
            pageColor: Color(0xffd8e8e5),
            titleTextStyle:
                TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            descriptionPadding: EdgeInsets.only(top: size.height * 0.08),
            titlePadding: EdgeInsets.only(top: size.height * 0.05),
            imagePadding: EdgeInsets.zero),
        body:
            "Discover a seamless experience with our College Management App;\n"
             "\nWhether you're a student \nor\n part of our wider community!",
                // " easily access schedules, resources, and essential college updates.",
        image: Image.asset(
          'assets/images/welcomescreen.png',
          width: size.width,
        ));
  }

  PageViewModel secondscreen() {
    Size size = MediaQuery.of(context).size;
    return PageViewModel(
      title: "Notifification's",
      decoration: PageDecoration(
          pageColor: Color(0xffd8e8e5),
          titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          descriptionPadding: EdgeInsets.only(top: size.height * 0.08),
          titlePadding: EdgeInsets.only(top: size.height * 0.05),
          imagePadding: EdgeInsets.zero),
      body:

      "Designed to keep everyone informed about latest campus updates & events.\n"
      "\nStay connected & stay updated on campus happenings.",

      image: Image.asset(

        'assets/images/noticescreen.png',
        width: size.width,
      ),
    );
  }

  PageViewModel thirdscreen() {
    Size size = MediaQuery.of(context).size;
    return PageViewModel(
      title: "Know More...",
      decoration: PageDecoration(
          pageColor: Color(0xffd8e8e5),
          titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          descriptionPadding: EdgeInsets.only(top: size.height * 0.08),
          titlePadding: EdgeInsets.only(top: size.height * 0.05),
          imagePadding: EdgeInsets.zero),
      body:
          "Here students can effortlessly manage their academic journey & access vital college-related information.\n"
          "\nWhether you're a student or not, this platform offers a comprehensive view of campus life and resources.",
      image: Image.asset(
        'assets/images/ebookscreen.png',
        width: size.width,
      ),
    );
  }
}
