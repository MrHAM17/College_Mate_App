// import 'package:flutter/material.dart';
//
// import '../../SECTIONS/USER_Admin/Login/login.dart';
// import '../../SECTIONS/USER_Admin/Login/signup.dart';
//
// class UpdateScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Admin',
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
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding from left & right
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => AdminLoginScreen()),
//                     );
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.all(20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Admin Login', style: TextStyle(fontSize: 18)),
//                         Icon(Icons.login),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Card(
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => AdminSignupScreen()),
//                     );
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.all(20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Admin Signup', style: TextStyle(fontSize: 18)),
//                         Icon(Icons.person_add),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
















import 'package:flutter/material.dart';
import '../../SECTIONS/USER_Admin/Login/login.dart';
import '../../SECTIONS/USER_Admin/Login/signup.dart';

class UpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin',
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
        toolbarHeight: 80.0,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.admin_panel_settings,
                    size: 100,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Welcome, Admin!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Please choose an action',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            buildCard(
              context,
              'Admin Login',
              Icons.login,
                  () => navigateToScreen(context, AdminLoginScreen()),
            ),
            SizedBox(height: 10),
            buildCard(
              context,
              'Admin Signup',
              Icons.person_add,
                  () => navigateToScreen(context, AdminSignupScreen()),
            ),
            SizedBox(height: 10),
            buildCard(
              context,
              'Administrator',
              Icons.lock,
              // Commented out the onTap code
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, IconData icon, [VoidCallback? onTap]) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
