// import 'package:flutter/material.dart';
// import 'package:flutter_sticky_header/flutter_sticky_header.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:college_mate/MODULES/Module_T&P/study_material_screen.dart';
// import 'package:college_mate/MODULES/Module_T&P/subject_info_screen.dart';
// import 'package:college_mate/UTILS/constants/colors.dart';
// import 'package:college_mate/UTILS/constants/textstyles.dart';
//
// class Subject extends StatefulWidget {
//   const Subject({Key? key}) : super(key: key);
//
//   @override
//   _SubjectState createState() => _SubjectState();
// }
//
// class _SubjectState extends State<Subject> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         clipBehavior: Clip.none,
//         shrinkWrap: true,
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             leadingWidth: 30,
//             floating: true,
//             title: Text("Study Material"),
//             backgroundColor: Colors.cyan,
//             flexibleSpace: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.topRight,
//                   colors: [
//                     // Color(0xffB1097C),
//                     // Color(0xff0947B1),
//                     Color(0xff43cea2),
//                     Color(0xff185a9d),
//                   ],
//                 ),
//               ),
//             ),
//             elevation: 20,
//             titleSpacing: 20,
//           ),
//           SliverToBoxAdapter(
//             child: SubjectPage(),
//           ),
//           SliverToBoxAdapter(
//             child: LabPage('hello'),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget SubjectPage() {
//     List<String> subjectList = <String>[
//       'Human Machine Interaction',
//       'Distributed Computing',
//       'Natural Language Processing',
//       'High Performance Computing',
//       'Major Project-II',
//       'Adhoc Wireless Network'
//     ];
//     var size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
//             child: Material(
//               color: Colors.white,
//               elevation: 10,
//               borderRadius: BorderRadius.circular(30),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
//                 child: Column(
//                   children: [
//                     Material(
//                       elevation: 10,
//                       borderRadius: BorderRadius.circular(150),
//                       color: Color(0xFF7ff0d4),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: size.width * 0.10, vertical: 8),
//                         child: Text(
//                           "Subjects",
//                           style: GoogleFonts.montserrat(
//                             textStyle: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     ListView.builder(
//                         itemCount: subjectList.length,
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         padding: EdgeInsets.zero,
//                         itemBuilder: (_, index) {
//                           int i;
//                           i = index + 1;
//                           return Padding(
//                             padding: const EdgeInsets.only(top: 20.0),
//                             child: Material(
//                               color: Color(0XFF81dbc9),
//                               borderRadius: BorderRadius.circular(25),
//                               elevation: 10,
//                               shadowColor: Colors.grey.shade300,
//                               child: Material(
//                                 borderRadius: BorderRadius.circular(25),
//                                 color: Colors.transparent,
//                                 child: InkWell(
//                                   onTap: () => {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 SubjectInfoScreen(
//                                                     subjectName:
//                                                         subjectList[index])))
//                                   },
//                                   borderRadius: BorderRadius.circular(25),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(25),
//                                     ),
//                                     height: 50,
//                                     width: size.width * 0.4,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(left: 15),
//                                           child: Text(("${i.toString()} ) "),
//                                               textAlign: TextAlign.center,
//                                               style: GoogleFonts.montserrat(
//                                                 textStyle: const TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 18,
//                                                     fontWeight:
//                                                         FontWeight.w500),
//                                               )),
//                                         ),
//                                         FittedBox(
//                                           fit: BoxFit.scaleDown,
//                                           child: Container(
//                                             width: size.width * 0.6,
//                                             child: Text(
//                                               subjectList[index],
//                                               textAlign: TextAlign.center,
//                                               style: GoogleFonts.montserrat(
//                                                 textStyle: const TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 18,
//                                                     fontWeight:
//                                                         FontWeight.w500),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 5),
//                                           child: Icon(
//                                             Icons.navigate_next_outlined,
//                                             color: Colors.white,
//                                             size: 30,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                     SizedBox(
//                       height: 20,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: size.height * 0.03,
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget LabPage(String text) {
//     List<String> labList = <String>[
//       'Human Machine Interaction Lab',
//       'Distributed Computing Lab',
//       'Cloud Computing Lab',
//       'Computational Lab-II'
//     ];
//     var size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: size.height * 0.03,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
//               child: Material(
//                 color: Colors.white,
//                 elevation: 10,
//                 borderRadius: BorderRadius.circular(30),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 10.0, vertical: 15),
//                   child: Column(
//                     children: [
//                       Material(
//                         elevation: 10,
//                         borderRadius: BorderRadius.circular(150),
//                         color: Color(0xFF7ff0d4),
//                         // color: Colors.grey.shade200,
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: size.width * 0.12, vertical: 10),
//                           child: Text("Subjects", style: headingStyle),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       ListView.builder(
//                           itemCount: labList.length,
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           padding: EdgeInsets.zero,
//                           itemBuilder: (_, index) {
//                             int i;
//                             i = index + 1;
//                             return Padding(
//                               padding: const EdgeInsets.only(top: 20.0),
//                               child: Material(
//                                 color: backgroundColor,
//                                 borderRadius: BorderRadius.circular(25),
//                                 elevation: 10,
//                                 shadowColor: Colors.grey.shade300,
//                                 child: Material(
//                                   borderRadius: BorderRadius.circular(25),
//                                   color: Colors.transparent,
//                                   child: InkWell(
//                                     onTap: () => {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   SubjectInfoScreen(
//                                                       subjectName:
//                                                           labList[index])))
//                                     },
//                                     borderRadius: BorderRadius.circular(25),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(25),
//                                       ),
//                                       height: 50,
//                                       width: size.width * 0.4,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(left: 15),
//                                             child: Text(("${i.toString()} ) "),
//                                                 textAlign: TextAlign.center,
//                                                 style: GoogleFonts.montserrat(
//                                                   textStyle: const TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 18,
//                                                       fontWeight:
//                                                           FontWeight.w500),
//                                                 )),
//                                           ),
//                                           FittedBox(
//                                             fit: BoxFit.scaleDown,
//                                             child: Container(
//                                               width: size.width * 0.6,
//                                               child: Text(
//                                                 labList[index],
//                                                 textAlign: TextAlign.center,
//                                                 style: GoogleFonts.montserrat(
//                                                   textStyle: const TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 18,
//                                                       fontWeight:
//                                                           FontWeight.w500),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 5),
//                                             child: Icon(
//                                               Icons.navigate_next_outlined,
//                                               color: Colors.white,
//                                               size: 30,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }),
//                       SizedBox(
//                         height: 20,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: size.height * 0.03,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
