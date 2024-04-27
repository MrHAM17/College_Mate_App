// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:college_mate/UTILS/constants/colors.dart';
//
// class Profile extends StatefulWidget {
//   String role;
//   Profile({Key? key, required this.role}) : super(key: key);
//   @override
//   _ProfileState createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   TextStyle tstyle = TextStyle(fontSize: 17, fontFamily: 'Montserrat-Bold');
//   var name = 'Harsh Anil Minde';
//   var rollno = '29';
//   var division = "C";
//   var department = 'CSE';
//   var semester = 'VI';
//   var addyear = '2021';
//   var id = 'TU3F2122164';
//
//   bool trigger = true;
//
//   File? profileImage;
//   File? bgImage;
//   final imgPicker = ImagePicker();
//
//   Future<void> showOptionsDialog(BuildContext context, String use) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Options"),
//             content: SingleChildScrollView(
//               child: use != 'background'
//                   ? ListBody(
//                       children: [
//                         GestureDetector(
//                           child: const Text("Capture Image From Camera"),
//                           onTap: () {
//                             openCamera(use);
//                           },
//                         ),
//                         const Padding(padding: EdgeInsets.all(10)),
//                         GestureDetector(
//                           child: const Text("Take Image From Gallery"),
//                           onTap: () {
//                             openGallery(use);
//                           },
//                         ),
//                       ],
//                     )
//                   : ListBody(
//                       children: [
//                         const Padding(padding: EdgeInsets.all(10)),
//                         GestureDetector(
//                           child: const Text("Take Image From Gallery"),
//                           onTap: () {
//                             openGallery(use);
//                           },
//                         ),
//                       ],
//                     ),
//             ),
//           );
//         });
//   }
//
//   void openCamera(String use) async {
//     if (use == 'background') {
//       var ImgBg = await imgPicker.pickImage(source: ImageSource.camera);
//
//       if (ImgBg == null) return;
//       setState(() {
//         bgImage = File(ImgBg.path);
//       });
//       Navigator.of(context).pop();
//     } else {
//       var ImgProfile = await imgPicker.pickImage(source: ImageSource.camera);
//
//       if (ImgProfile == null) return;
//       setState(() {
//         profileImage = File(ImgProfile.path);
//       });
//       Navigator.of(context).pop();
//     }
//   }
//
//   void openGallery(String use) async {
//     if (use == 'background') {
//       var ImgBg = await imgPicker.pickImage(source: ImageSource.gallery);
//       if (ImgBg == null) return;
//       setState(() {
//         bgImage = File(ImgBg.path);
//       });
//       Navigator.of(context).pop();
//     } else {
//       var ImgProfile = await imgPicker.pickImage(source: ImageSource.gallery);
//       if (ImgProfile == null) return;
//       setState(() {
//         profileImage = File(ImgProfile.path);
//       });
//       Navigator.of(context).pop();
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   var wStyle = GoogleFonts.montserrat(
//     textStyle: const TextStyle(
//         color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
//   );
//   var bStyle = GoogleFonts.montserrat(
//     textStyle: const TextStyle(
//         color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.role == 'faculty') {
//       trigger = false;
//     }
//
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         backgroundColor: const Color(0xffd8e8e5),
//         body: Container(
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 decoration: BoxDecoration(),
//                 width: size.width,
//                 height: size.height * 0.4,
//                 child: bgImage == null
//                     ? Image.asset(
//                         'assets/images/banner.jpg',
//                         fit: BoxFit.cover,
//                       )
//                     : Image.file(
//                         bgImage!,
//                         fit: BoxFit.cover,
//                       ),
//               ),
//               Positioned(
//                 top: 0,
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Center(
//                   child: Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       Material(
//                         elevation: 20,
//                         shadowColor: Colors.yellow,
//                         borderRadius: BorderRadius.circular(67),
//                         child: CircleAvatar(
//                             radius: 67,
//                             backgroundImage: profileImage == null
//                                 ? AssetImage(
//                                     'assets/images/myself.jpg',
//                                   )
//                                 : Image.file(
//                                     profileImage!,
//                                     fit: BoxFit.fill,
//                                   ).image),
//                       ),
//                       Positioned(
//                         bottom: 5,
//                         right: 5,
//                         child: InkWell(
//                           onTap: () => showOptionsDialog(context, ''),
//                           child: CircleAvatar(
//                             radius: 15,
//                             backgroundColor: Colors.white,
//                             child: Icon(
//                               Icons.mode_edit_rounded,
//                               color: Colors.black,
//                               size: 25,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 40,
//                 right: 5,
//                 child: InkWell(
//                   onTap: () => showOptionsDialog(context, 'background'),
//                   child: Material(
//                     shadowColor: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     elevation: 10,
//                     child: CircleAvatar(
//                       radius: 17,
//                       backgroundColor: Colors.white,
//                       child: Icon(
//                         Icons.mode_edit_rounded,
//                         color: Colors.black,
//                         size: 28,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                   right: 0,
//                   left: 0,
//                   top: size.height * 0.35,
//                   child: Center(
//                     child: SingleChildScrollView(
//                       child: Material(
//                         borderRadius: BorderRadius.circular(10),
//                         elevation: 5,
//                         child: Container(
//                           width: size.width * 0.85,
//                           height: size.height * 0.63,
//                           decoration: BoxDecoration(
//                             color: secondaryBG,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Column(
//                             children: [
//                               Material(
//                                 color: backgroundColor,
//                                 borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(10),
//                                     topLeft: Radius.circular(10)),
//                                 elevation: 3,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Container(
//                                       height: size.height * 0.1,
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           Text(
//                                             "Attendance",
//                                             style: bStyle,
//                                           ),
//                                           Text("83.6 %", style: wStyle)
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       height: size.height * 0.1,
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           Text(
//                                             "Department",
//                                             style: bStyle,
//                                           ),
//                                           Text(
//                                             department,
//                                             style: wStyle,
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       height: size.height * 0.1,
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           Text(
//                                             "Semester",
//                                             style: bStyle,
//                                           ),
//                                           Text(semester, style: wStyle)
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: size.height * 0.015,
//                               ),
//                               ListTile(
//                                 leading: Container(
//                                   width: 45,
//                                   height: 40,
//                                   child: Center(
//                                     child: Icon(
//                                       Icons.person_outline,
//                                       size: 40,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 title: Text(
//                                   'Name',
//                                   style: bStyle,
//                                 ),
//                                 subtitle: Text(name, style: wStyle),
//                               ),
//                               ListTile(
//                                 leading: Container(
//                                   width: 45,
//                                   height: 40,
//                                   child: Center(
//                                     child: Icon(
//                                       Icons.assignment_outlined,
//                                       size: 40,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 title: Text(
//                                   'ID',
//                                   style: bStyle,
//                                 ),
//                                 subtitle: Text(id, style: wStyle),
//                               ),
//                               trigger
//                                   ? ListTile(
//                                       leading: Container(
//                                         width: 45,
//                                         height: 40,
//                                         child: Center(
//                                           child: Icon(
//                                             Icons.filter_1_outlined,
//                                             size: 40,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                       title: Text(
//                                         'Roll Number ',
//                                         style: bStyle,
//                                       ),
//                                       subtitle: Text("$division-$rollno",
//                                           style: wStyle),
//                                     )
//                                   : ListTile(
//                                       leading: Container(
//                                         width: 45,
//                                         height: 40,
//                                         child: Center(
//                                           child: Icon(
//                                             Icons.filter_1_outlined,
//                                             size: 40,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                       title: Text('Cabin number'),
//                                       subtitle: Text(
//                                         "$division-$rollno",
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 17,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ),
//                               ListTile(
//                                 leading: Container(
//                                   width: 45,
//                                   height: 40,
//                                   child: Center(
//                                     child: Icon(
//                                       Icons.email_outlined,
//                                       size: 40,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 title: Text(
//                                   'Email',
//                                   style: bStyle,
//                                 ),
//                                 subtitle: Text("harsh@gmail.com",
//                                     style: wStyle),
//                               ),
//                               ListTile(
//                                 leading: Container(
//                                   width: 45,
//                                   height: 40,
//                                   child: Center(
//                                     child: Icon(
//                                       Icons.phone_android_outlined,
//                                       size: 40,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 title: Text(
//                                   'Phone',
//                                   style: bStyle,
//                                 ),
//                                 subtitle: Text("1234567890", style: wStyle),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   )),
//               Positioned(
//                 top: 40,
//                 left: 20,
//                 child: InkWell(
//                     onTap: () => Navigator.maybePop(context),
//                     child: Icon(
//                       Icons.arrow_back_sharp,
//                       color: Colors.white,
//                       size: 25,
//                     )),
//               ),
//             ],
//           ),
//         ));
//   }
// }
