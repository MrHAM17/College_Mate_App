import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mech_it/MODULES/Module_StudentProfile/show_applied_ae_opp_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../SECTIONS/USER_Student/login.dart';
import 'apply_ae_opp_page.dart';
import 'calendar.dart';
import 'fees.dart';

class ProfilePage extends StatefulWidget {
  final String? selectedCollege;
  final String? studentBranch;
  final String? studentId;

  ProfilePage({
    Key? key,
    required this.selectedCollege,
    required this.studentId,
    required this.studentBranch,
  }) : super(key: key);


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffd8e8e5),
      body: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipPath(
                      clipBehavior: Clip.antiAlias,
                      clipper: OvalBottomBorderClipper(),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 40,
                        child: Container(
                          height: size.height * 0.227,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    ClipPath(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      clipper: OvalBottomBorderClipper(),
                      child: Material(
                        elevation: 1000,
                        child: Container(
                          height: size.height * 0.22,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(20, 30),
                                color: Colors.black,
                                blurRadius: 50.0,
                              ),
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xff43cea2),
                                Color(0xff185a9d),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -60,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Material(
                          elevation: 20,
                          borderRadius: BorderRadius.circular(67),
                          child: const CircleAvatar(
                            radius: 67,
                            backgroundImage:
                            AssetImage('assets/images/myself.jpg'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 35, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: greeting(),
                                ),
                                TextSpan(
                                  text: " Harsh",
                                ),
                              ],
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                              sharedPreferences.remove('token');
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                                    (Route<dynamic> route) => false,
                              );
                            },
                            child: Icon(
                              Icons.logout_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: size.width * 0.2,
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Harsh Minde",
                          ),
                        ],
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Grid of Cards
                SizedBox(
                  height: size.height * 0.6,
                  child: GridView.count(
                    padding: EdgeInsets.all(16),
                    crossAxisCount: 2,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Personl_Details()),
                          // );
                        },
                        child: CardView(
                          title: 'Personl Details',
                          child: Icon(Icons.calendar_today),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Calendar()),
                          );
                        },
                        child: CardView(
                          title: 'Calendar',
                          child: Icon(Icons.calendar_today),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FeeScreen()),
                          );
                        },
                        child: CardView(
                          title: 'Fees',
                          child: Icon(Icons.calendar_today),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ApplyAeOppPage(
                              selectedCollege: widget.selectedCollege ?? '',
                              studentId: widget.studentId ?? '',
                              studentBranch: widget.studentBranch ?? '',
                            )),
                          );
                        },
                        child: CardView(
                          title: 'Apply',
                          child: Icon(Icons.calendar_today),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => ShowAppliedAeOppTab(
                          //     selectedCollege: widget.selectedCollege ?? '',
                          //     studentId: widget.studentId ?? '',
                          //     studentBranch: widget.studentBranch ?? '',
                          //   )),
                          // );
                        },
                        child: CardView(
                          title: 'View AEA',
                          child: Icon(Icons.calendar_today),
                        ),
                      ),

                    ],
                  ),
                ),



              ],
            ),
          ),
        ],
      ),
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}

class OvalBottomBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}


class CardView extends StatelessWidget {
  final String title;
  final Widget child;

  CardView({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}