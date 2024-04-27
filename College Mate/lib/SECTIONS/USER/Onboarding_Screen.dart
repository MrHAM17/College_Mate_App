// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class PostMainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Introduction Screen Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: IntroScreen(),
//     );
//   }
// }
//
// class IntroScreen extends StatefulWidget {
//   @override
//   _IntroScreenState createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen> {
//   final introKey = GlobalKey<IntroductionScreenState>();
//
//   Future<void> _setIntroSeen() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('seenIntro', true);
//   }
//
//   Future<bool> _getIntroSeen() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool('seenIntro') ?? false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//       future: _getIntroSeen(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           bool seenIntro = snapshot.data ?? false;
//           if (!seenIntro) {
//             return buildIntroScreen();
//           } else {
//             return LoginPage();
//           }
//         } else {
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
//
//   Widget buildIntroScreen() {
//     return IntroductionScreen(
//       key: introKey,
//       globalBackgroundColor: Color(0xffd8e8e5),
//       showNextButton: false,
//       done: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 5,
//         ),
//         child: Text('Done'),
//       ),
//       onDone: () {
//         _setIntroSeen();
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => LoginPage(),
//           ),
//         );
//       },
//       pages: [
//         firstScreen(),
//         secondScreen(),
//         thirdScreen(),
//       ],
//     );
//   }
//
//   PageViewModel firstScreen() {
//     Size size = MediaQuery.of(context).size;
//     return PageViewModel(
//       title: 'Welcome',
//       decoration: PageDecoration(
//         pageColor: Color(0xffd8e8e5),
//         titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//         bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//         descriptionPadding: EdgeInsets.only(top: size.height * 0.08),
//         titlePadding: EdgeInsets.only(top: size.height * 0.05),
//         imagePadding: EdgeInsets.zero,
//       ),
//       body: "Discover a seamless experience with our College Management App;\n"
//           "\nWhether you're a student \nor\n part of our wider community!",
//       image: Image.asset(
//         'assets/images/welcomescreen.png',
//         width: size.width,
//       ),
//     );
//   }
//
//   PageViewModel secondScreen() {
//     Size size = MediaQuery.of(context).size;
//     return PageViewModel(
//       title: "Notifications",
//       decoration: PageDecoration(
//         pageColor: Color(0xffd8e8e5),
//         titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//         bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//         descriptionPadding: EdgeInsets.only(top: size.height * 0.08),
//         titlePadding: EdgeInsets.only(top: size.height * 0.05),
//         imagePadding: EdgeInsets.zero,
//       ),
//       body: "Designed to keep everyone informed about latest campus updates & events.\n"
//           "\nStay connected & stay updated on campus happenings.",
//       image: Image.asset(
//         'assets/images/noticescreen.png',
//         width: size.width,
//       ),
//     );
//   }
//
//   PageViewModel thirdScreen() {
//     Size size = MediaQuery.of(context).size;
//     return PageViewModel(
//       title: "Know More...",
//       decoration: PageDecoration(
//         pageColor: Color(0xffd8e8e5),
//         titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//         bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//         descriptionPadding: EdgeInsets.only(top: size.height * 0.08),
//         titlePadding: EdgeInsets.only(top: size.height * 0.05),
//         imagePadding: EdgeInsets.zero,
//       ),
//       body: "Here students can effortlessly manage their academic journey & access vital college-related information.\n"
//           "\nWhether you're a student or not, this platform offers a comprehensive view of campus life and resources.",
//       image: Image.asset(
//         'assets/images/ebookscreen.png',
//         width: size.width,
//       ),
//     );
//   }
//
//   Widget LoginPage() {
//     // Implement your login page here
//     return Scaffold(
//       body: Center(
//         child: Text('Login Page'),
//       ),
//     );
//   }
// }






//  Above code -->  intro to login only
//  Below code -->  above + if already logged in then mainscreen






import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../USER_Student/login.dart';
import 'Home_Screen.dart';

import 'package:flutter/services.dart';

import 'package:introduction_screen/introduction_screen.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> _setIntroSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenIntro', true);
  }

  Future<bool> _getIntroSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('seenIntro') ?? false;
  }

  Future<bool> _isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _getIntroSeen(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          bool seenIntro = snapshot.data ?? false;
          if (!seenIntro) {
            return buildIntroScreen();
          } else {
            return FutureBuilder<bool>(
              future: _isLoggedIn(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  bool isLoggedIn = snapshot.data ?? false;
                  if (isLoggedIn) {
                    return HomeScreen();
                  } else {
                    return LoginPage();
                  }
                } else {
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget buildIntroScreen() {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Color(0xffd8e8e5),
      showNextButton: false,
      done: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: Text('Done'),
      ),
      onDone: () {
        _setIntroSeen();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
      pages: [
        firstScreen(),
        secondScreen(),
        thirdScreen(),
      ],
    );
  }

  PageViewModel firstScreen() {
    Size size = MediaQuery.of(context).size;
    return PageViewModel(
      title: 'Welcome',
      decoration: PageDecoration(
        pageColor: Color(0xffd8e8e5),
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        // descriptionPadding: EdgeInsets.only(top: size.height * 0.08),
        titlePadding: EdgeInsets.only(top: size.height * 0.05),
        imagePadding: EdgeInsets.zero,
      ),
      body: "Discover a seamless experience with our College Management App;\n"
          "\nWhether you're a student \nor\n part of our wider community!",
      image: Image.asset(
        'assets/images/welcomescreen.png',
        width: size.width,
      ),
    );
  }

  PageViewModel secondScreen() {
    Size size = MediaQuery.of(context).size;
    return PageViewModel(
      title: "Notifications",
      decoration: PageDecoration(
        pageColor: Color(0xffd8e8e5),
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        // descriptionPadding: EdgeInsets.only(top: size.height * 0.08),
        titlePadding: EdgeInsets.only(top: size.height * 0.05),
        imagePadding: EdgeInsets.zero,
      ),
      body: "Designed to keep everyone informed about latest campus updates & events.\n"
          "\nStay connected & stay updated on campus happenings.",
      image: Image.asset(
        'assets/images/noticescreen.png',
        width: size.width,
      ),
    );
  }

  PageViewModel thirdScreen() {
    Size size = MediaQuery.of(context).size;
    return PageViewModel(
      title: "Know More...",
      decoration: PageDecoration(
        pageColor: Color(0xffd8e8e5),
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        // descriptionPadding: EdgeInsets.only(top: size.height * 0.08),
        titlePadding: EdgeInsets.only(top: size.height * 0.05),
        imagePadding: EdgeInsets.zero,
      ),
      body: "Here students can effortlessly manage their academic journey & access vital college-related information.\n"
          "\nWhether you're a student or not, this platform offers a comprehensive view of campus life and resources.",
      image: Image.asset(
        'assets/images/ebookscreen.png',
        width: size.width,
      ),
    );
  }
}
