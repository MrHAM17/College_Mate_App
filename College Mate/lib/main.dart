// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
//
// import 'package:mech_it/common/login_page.dart';
// import 'package:mech_it/common/login_page.dart';
// import 'package:mech_it/common/spalsh_screen.dart';
// import 'package:mech_it/mechanic/mech_earning_screen.dart';
// import 'package:mech_it/user/break_downs_services_page.dart';
// import 'package:mech_it/user/car_details.dart';
// import 'package:mech_it/user/mechanic_services_page.dart';
// import 'package:mech_it/user/routine_maintenance_services_page.dart';
// import 'package:mech_it/user/user_register_page.dart';
// import 'package:mech_it/mechanic/mech_register_page.dart';
// import 'package:mech_it/user/user_home_page.dart';
// import 'package:mech_it/mechanic/mech_home_screen.dart';
//
//
// import 'package:mech_it/user/my_cars.dart'; // Import the MyCarsScreen
// import 'package:mech_it/user/winch_services_page.dart';
//
// import 'package:mech_it/user/selected_services_page.dart';
// import 'package:mech_it/mechanic/mech_earning_screen.dart';
//
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: ${message.messageId}");
//   // Handle the FCM message received in the background.
// }
//
// void main() async {
//
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Mech !t',
//       theme: ThemeData(primarySwatch: Colors.deepPurple      ),
//       // home: const MyHomePage(title: 'Flutter Demo Home Page'),
//       home: LoginPage(context: context,),
//
// // ***
//
//       // initialRoute: 'LoginPage',
//
//       routes: {
//         // 'LoginPage': (context) => LoginPage(),
//         'UserRegisterPage': (context) => UserRegisterPage(),
//         // 'MechRegisterPage': (context) => MechRegisterPage(),
//         'UserHomePage': (context) => UserHomePage(),
//         'MechHomePage': (context) => MechHomePage(),
//         'my_cars_screen': (context) => MyCarsScreen(),
//         // 'MechanicServisesPage': (context) =>  MechanicServicesPage(),
//         'WinchiServisesPage': (context) =>  WinchServicesPage(),
//         'BreakDownsServicesPage': (context) => BreakDownsServicesPage(),
//         'RoutineMaintenanceServicesPage': (context) => RoutineMaintenanceServicesPage(),
//         // 'SelectedServicePage': (context) => SelectedServicePage(),
//
//         // 'LoginPage': (context) => LoginPage(),
//         // 'LoginPage': (context) => MechRegisterPage(),
//         'MechEarningScreen': (context) => MechEarningScreen(),
//       },
//
// ///////   OR  ////////
//
// //        home: LoginPage(), );
//
// ///////   OR  ////////
//
// //       home: SpalshScreen(),
// //       debugShowCheckedModeBanner: false, );
//
// ///////   OR  ////////
//
//       // home: AnimatedSplashScreen(
//       // splash: "assets/mechanic images/real_splash_screen.png", splashIconSize: 700,
//       // splashTransition: SplashTransition.scaleTransition,
//       // backgroundColor: Colors.purple.shade800,
//       // duration: 0500,
//       //   nextScreen: LoginPage(), ),
//       // debugShowCheckedModeBanner: false, );
//
//
// // *** //
//
//     );
//
//   }
// }
//
//





///////////

//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
//
// import 'package:firebase_core/firebase_core.dart';
//
//
// import 'SECTIONS/USER/SAAS_App_Screen.dart';
// import 'SECTIONS/Home/Onboarding_Screen.dart';
// import 'package:permission_handler/permission_handler.dart';
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//     // Platform.isAndroid
//     //     ?  await Firebase.initializeApp(
//     //   options: const FirebaseOptions(
//     //     apiKey: "AIzaSyDJn73S18XhR2mAhsJh6ihY-d9Dibukw8Y",
//     //     appId: "1:962899707976:android:667c1658b25a811861b07d",
//     //     messagingSenderId: "962899707976",
//     //     projectId: "college-mate-621e8",
//     //   ),
//     // )  : await Firebase.initializeApp();
//
//   await Firebase.initializeApp();
//   // await PermissionHandler().requestPermissions([Permission.storage]);
//
//   // Request storage permission
//   var status = await Permission.storage.request();
//   // if (status.isDenied) {
//   //   print('Permission denied');
//   // }
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//
//       home: SAASScreen(),
//       // home: OnboardingScreen(),
//
//     );
//   }
// }
//








import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'SECTIONS/USER/SAAS_App_Screen.dart';
import 'SECTIONS/Home/Onboarding_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Request storage permission
  await Permission.storage.request();
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
      home: SAASScreen(),
    );
  }
}
