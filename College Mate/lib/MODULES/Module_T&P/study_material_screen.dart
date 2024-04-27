// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:college_mate/MODULES/Module_T&P/faculty_information.dart';
import 'package:college_mate/MODULES/Module_T&P/subject_info_screen.dart';
import 'package:college_mate/MODULES/Module_T&P/timetable.dart';
import 'package:college_mate/UTILS/constants/colors.dart';
import 'package:college_mate/UTILS/constants/textstyles.dart';

class StudyMaterialScreen extends StatefulWidget {
  StudyMaterialScreen({Key? key}) : super(key: key);

  @override
  _StudyMaterialScreenState createState() => _StudyMaterialScreenState();
}

class _StudyMaterialScreenState extends State<StudyMaterialScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return DefaultTabController(
        length: 2,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              leadingWidth: 30,
              floating: true,
              title: Text(
                "EBooks",
                style: headingStyle,
              ),
              centerTitle: true,
              backgroundColor: Colors.cyan,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      // Color(0xffB1097C),
                      // Color(0xff0947B1),
                      Color(0xff43cea2),
                      Color(0xff185a9d),
                    ],
                  ),
                ),
              ),
              bottom: TabBar(
                labelStyle: tabStyle,
                indicatorColor: Colors.white,
                indicatorWeight: 5,
                tabs: [
                  Tab(
                    text: "Subject E-Books",
                    icon: Icon(Icons.library_books_outlined),
                  ),
                  Tab(
                    text: "Lab Manuals",
                    icon: Icon(Icons.library_add_check_outlined),
                  ),
                ],
              ),
              elevation: 20,
              titleSpacing: 20,
            ),
          ],
          body: TabBarView(
            children: [
              SubjectPage('Faculty Information'),
              LabPage('Timetable'),
            ],
          ),
        ));
  }

  Widget SubjectPage(String text) {
    List<String> subjectList = <String>[
      'Human Machine Interaction',
      'Distributed Computing',
      'Natural Language Processing',
      'High Performance Computing',
      'Major Project-II',
      'Adhoc Wireless Network'
    ];
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //ROW 1
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Material(
                  borderRadius: BorderRadius.circular(25),
                  elevation: 10,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FacultyList()));
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff5df5c5),
                      ),
                      height: size.height * 0.18,
                      width: size.width * 0.36,
                      margin: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: Center(
                          child: Text(
                            "Faculty Information",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Material(
                  borderRadius: BorderRadius.circular(25),
                  elevation: 10,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TimeTableScreen()));
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xff599ee3),
                      ),
                      height: size.height * 0.18,
                      width: size.width * 0.36,
                      margin:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        child: Center(
                          child: Text(
                            "TimeTable",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Material(
              color: Colors.white,
              elevation: 10,
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Column(
                  children: [
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(150),
                      color: Color(0xFF7ff0d4),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.10, vertical: 8),
                        child: Text(
                          "Subjects",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ListView.builder(
                        itemCount: subjectList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, index) {
                          int i;
                          i = index + 1;
                          return Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Material(
                              color: Color(0XFF81dbc9),
                              borderRadius: BorderRadius.circular(25),
                              elevation: 10,
                              shadowColor: Colors.grey.shade300,
                              child: Material(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SubjectInfoScreen(
                                                    subjectName:
                                                        subjectList[index])))
                                  },
                                  borderRadius: BorderRadius.circular(25),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    height: 50,
                                    width: size.width * 0.4,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(("${i.toString()} ) "),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Container(
                                            width: size.width * 0.6,
                                            child: Text(
                                              subjectList[index],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Icon(
                                            Icons.navigate_next_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          )
        ],
      ),
    );
  }

  Widget LabPage(String text) {
    List<String> labList = <String>[
      'Human Machine Interaction Lab',
      'Distributed Computing Lab',
      'Cloud Computing Lab',
      'Computational Lab-II'
    ];
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
              child: Material(
                color: Colors.white,
                elevation: 10,
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: Column(
                    children: [
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(150),
                        color: Color(0xFF7ff0d4),
                        // color: Colors.grey.shade200,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.12, vertical: 10),
                          child: Text("Subjects", style: headingStyle),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListView.builder(
                          itemCount: labList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (_, index) {
                            int i;
                            i = index + 1;
                            return Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Material(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(25),
                                elevation: 10,
                                shadowColor: Colors.grey.shade300,
                                child: Material(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SubjectInfoScreen(
                                                      subjectName:
                                                          labList[index])))
                                    },
                                    borderRadius: BorderRadius.circular(25),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      height: 50,
                                      width: size.width * 0.4,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(("${i.toString()} ) "),
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )),
                                          ),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Container(
                                              width: size.width * 0.6,
                                              child: Text(
                                                labList[index],
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Icon(
                                              Icons.navigate_next_outlined,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            )
          ],
        ),
      ),
    );
  }
}
