import 'package:flutter/material.dart';

import '../Module_CollegeProfile/college_about_page.dart';
import 'package:college_mate/MODULES/Module_CollegeProfile/college_about_page.dart';

import 'college_campus_page.dart';
import 'college_contact_page.dart';
import 'college_courses_page.dart';
import 'college_events_page.dart';
import 'college_gallary_page.dart';
import 'college_support_page.dart';
import 'college_admin_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GuestScreen(),
    );
  }
}

// class GuestScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Text(
//             'Welcome to College App',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           IconButton(
//             onPressed: () {
//               // Add your action here
//             },
//             icon: Icon(Icons.notifications),
//           ),
//           IconButton(
//             onPressed: () {
//               // Add your action here
//             },
//             icon: Icon(Icons.settings),
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/background.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               CustomButton(
//                 text: 'Gallery',
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => GalleryScreen()),
//                   );
//                 },
//               ),
//               SizedBox(height: 20),
//               CustomButton(
//                 text: 'About',
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AboutScreen()),
//                   );
//                 },
//               ),
//               SizedBox(height: 20),
//               CustomButton(
//                 text: 'Courses',
//                 onPressed: () {
//                   // Add your action here
//                 },
//               ),
//               SizedBox(height: 20),
//               CustomButton(
//                 text: 'Events',
//                 onPressed: () {
//                   // Add your action here
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class GuestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Container(
      //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //     decoration: BoxDecoration(
      //       color: Colors.blue,
      //       borderRadius: BorderRadius.circular(15),
      //     ),
      //     child: Text(
      //       'Welcome to College App',
      //       style: TextStyle(
      //         fontSize: 24,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         // Add your action here
      //       },
      //       icon: Icon(Icons.notifications),
      //     ),
      //   ],
      // ),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Adjust the height as needed
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                    "\nTPCT's TEC College Mgt App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),


      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(35,10, 35, 2),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/guest_bg.jg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing:20,
          mainAxisSpacing:20,
          children: <Widget>[
            CustomButton(
              text: 'About',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
            ),
            CustomButton(
              text: 'Updates',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateScreen()),
                );
              },
            ),
            CustomButton(
              text: 'Events',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventsPage()),
                );              },
            ),
            CustomButton(
              text: 'Gallery',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GallaryPage()),    // GalleryScreen
                );
              },
            ),

            CustomButton(
              text: 'Courses',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoursesScreen()),
                );              },
            ),
            CustomButton(
              text: 'Campus',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CampusScreen()),
                );              },
            ),
            CustomButton(
              text: 'Contact',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactScreen()),
                );              },
            ),
            CustomButton(
              text: 'Support',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SupportScreen()),
                );              },
            ),
          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
