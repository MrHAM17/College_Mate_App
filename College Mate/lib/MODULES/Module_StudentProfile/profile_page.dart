// import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:college_mate/MODULES/Module_StudentProfile/calendar.dart';
// import 'package:college_mate/SECTIONS/Login/login.dart';
// import 'package:college_mate/MODULES/Module_StudentProfile/fees.dart';
// import 'package:college_mate/MODULES/Module_StudentProfile/profile.dart';
// import 'package:college_mate/MODULES/Module_StudentProfile/subject.dart';
// import 'package:college_mate/UTILS/constants/textstyles.dart';
//
// // ignore: must_be_immutable
// class ProfilePage extends StatefulWidget {
//   String role;
//   ProfilePage({required this.role}) : super();
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: const Color(0xffd8e8e5),
//       body: CustomScrollView(
//         clipBehavior: Clip.none,
//         slivers: [
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     ClipPath(
//                       clipBehavior: Clip.antiAlias,
//                       clipper: OvalBottomBorderClipper(),
//                       child: Material(
//                         color: Colors.transparent,
//                         elevation: 40,
//                         child: Container(
//                           height: size.height * 0.227,
//                           color: Colors.transparent,
//                         ),
//                       ),
//                     ),
//                     ClipPath(
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       clipper: OvalBottomBorderClipper(),
//                       child: Material(
//                         elevation: 1000,
//                         child: Container(
//                           height: size.height * 0.22,
//                           decoration: BoxDecoration(
//                             boxShadow: const [
//                               BoxShadow(
//                                 offset: Offset(20, 30),
//                                 color: Colors.black,
//                                 blurRadius: 50.0,
//                               ),
//                             ],
//                             gradient: customLinearGradient(),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: -60,
//                       left: 0,
//                       right: 0,
//                       child: Center(
//                         child: Material(
//                           elevation: 20,
//                           borderRadius: BorderRadius.circular(67),
//                           child: const CircleAvatar(
//                             radius: 67,
//                             backgroundImage:
//                                 AssetImage('assets/images/myself.jpg'),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 35, left: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                               onTap: () => Navigator.pop(context),
//                               child: Icon(
//                                 Icons.arrow_back_outlined,
//                                 color: Colors.white,
//                                 size: 25,
//                               )),
//                           RichText(
//                             text: TextSpan(children: [
//                               TextSpan(
//                                 text: greeting(),
//                               ),
//                               TextSpan(
//                                 text: " Harsh",
//                               ),
//                             ], style: headingStyle),
//                           ),
//                           GestureDetector(
//                             onTap: () async {
//                               SharedPreferences sharedPreferences =
//                                   await SharedPreferences.getInstance();
//                               sharedPreferences.remove('token');
//                               Navigator.of(context).pushAndRemoveUntil(
//                                   MaterialPageRoute(
//                                       builder: (context) => LoginPage()),
//                                   (Route<dynamic> route) => false);
//                             },
//                             child: Icon(
//                               Icons.logout_outlined,
//                               color: Colors.white,
//                               size: 28,
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 Container(
//                   margin: EdgeInsets.only(
//                     top: size.width * 0.2,
//                   ),
//                   child: Center(
//                     child: RichText(
//                       text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: "Harsh Minde",
//                             ),
//                           ],
//                           style: GoogleFonts.montserrat(
//                             textStyle: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w600),
//                           )),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                       top: size.height * 0.06, left: 35, right: 35),
//                   child: SizedBox(
//                     width: size.width * 0.9,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           // margin: const EdgeInsets.only(left: 20),
//                           width: size.width * 0.37,
//                           height: size.height * 0.46,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: const Color(0xff43cda2),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                           color: Colors.black54,
//                                           blurRadius: 10.0,
//                                           offset: Offset(2, 2))
//                                     ],
//                                     borderRadius: BorderRadius.circular(15)),
//                                 child: Material(
//                                   borderRadius: BorderRadius.circular(15),
//                                   color: Colors.transparent,
//                                   child: InkWell(
//                                     borderRadius: BorderRadius.circular(15),
//                                     splashColor:
//                                         const Color(0xff396dbf).withAlpha(50),
//                                     onTap: () => {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => Profile(
//                                                     role: widget.role,
//                                                   )))
//                                     },
//                                     child: Center(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           Icon(
//                                             FontAwesomeIcons.user,
//                                             color: Colors.white,
//                                             size: 50,
//                                           ),
//                                           SizedBox(
//                                             height: 60,
//                                             child: Text(
//                                               'Personal Information',
//                                               textAlign: TextAlign.center,
//                                               style: normalStyle,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 height: size.height * 0.22,
//                                 width: size.width * 0.35,
//                               ),
//                               const SizedBox(
//                                 height: 30,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: const Color(0xff7cb2d1).withRed(30),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                           color: Colors.black54,
//                                           blurRadius: 10.0,
//                                           offset: Offset(2, 2))
//                                     ],
//                                     borderRadius: BorderRadius.circular(15)),
//                                 height: 110,
//                                 width: size.width * 0.35,
//                                 child: Material(
//                                   color: Colors.transparent,
//                                   borderRadius: BorderRadius.circular(15),
//                                   child: InkWell(
//                                     onTap: () => {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => Subject()))
//                                     },
//                                     borderRadius: BorderRadius.circular(15),
//                                     splashColor:
//                                         const Color(0xff396dbf).withAlpha(50),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Icon(
//                                           FontAwesomeIcons.book,
//                                           size: 50,
//                                           color: Colors.white,
//                                         ),
//                                         SizedBox(
//                                           height: 30,
//                                           child: Text('Subject',
//                                               textAlign: TextAlign.center,
//                                               style: normalStyle),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: size.width * 0.37,
//                           height: size.height * 0.42,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: const Color(0xff3fb9bf),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                           color: Colors.black54,
//                                           blurRadius: 10.0,
//                                           offset: Offset(2, 2))
//                                     ],
//                                     borderRadius: BorderRadius.circular(15)),
//                                 height: 110,
//                                 width: size.width * 0.35,
//                                 child: Material(
//                                   color: Colors.transparent,
//                                   borderRadius: BorderRadius.circular(15),
//                                   child: InkWell(
//                                     onTap: () => {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) => Calendar()))
//                                     },
//                                     borderRadius: BorderRadius.circular(15),
//                                     splashColor:
//                                         const Color(0xff396dbf).withAlpha(50),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Icon(
//                                           FontAwesomeIcons.calendarAlt,
//                                           size: 50,
//                                           color: Colors.white,
//                                         ),
//                                         SizedBox(
//                                           height: 30,
//                                           child: Text(
//                                             'Calendar',
//                                             textAlign: TextAlign.center,
//                                             style: normalStyle,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 30,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: const Color(0xff396dbf),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                           color: Colors.black54,
//                                           blurRadius: 10.0,
//                                           offset: Offset(2, 2))
//                                     ],
//                                     borderRadius: BorderRadius.circular(15)),
//                                 height: size.height * 0.22,
//                                 width: size.width * 0.35,
//                                 child: Material(
//                                   borderRadius: BorderRadius.circular(15),
//                                   color: Colors.transparent,
//                                   child: InkWell(
//                                     onTap: () => Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => FeeScreen())),
//                                     borderRadius: BorderRadius.circular(15),
//                                     splashColor:
//                                         const Color(0xff43cda2).withAlpha(50),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                               left: size.width * 0.07,
//                                               right: size.width * 0.07,
//                                               top: 3),
//                                           child: Text(
//                                             'Fees Status',
//                                             textAlign: TextAlign.center,
//                                             style: normalStyle,
//                                           ),
//                                         ),
//                                         Icon(
//                                           FontAwesomeIcons.rupeeSign,
//                                           size: 50,
//                                           color: Colors.white,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   String greeting() {
//     var hour = DateTime.now().hour;
//     if (hour < 12) {
//       return 'Good Morning';
//     }
//     if (hour < 17) {
//       return 'Good Afternoon';
//     }
//     return 'Good Evening';
//   }
//
//   Widget gradientPadding() {
//     Size size = MediaQuery.of(context).size;
//     return SliverToBoxAdapter(
//       child: Container(
//         height: size.height * 0.03,
//         decoration: BoxDecoration(gradient: customLinearGradient()),
//       ),
//     );
//   }
//
//   LinearGradient customLinearGradient() {
//     return const LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.topRight,
//       colors: [
//         // Color(0xffB1097C),
//         // Color(0xff0947B1),
//         Color(0xff43cea2),
//         Color(0xff185a9d),
//       ],
//     );
//   }
// }
