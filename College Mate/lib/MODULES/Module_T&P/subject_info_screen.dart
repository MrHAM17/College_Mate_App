import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:college_mate/UTILS/constants/colors.dart';
import 'package:college_mate/UTILS/constants/textstyles.dart';

class SubjectInfoScreen extends StatefulWidget {
  String subjectName;
  SubjectInfoScreen({Key? key, required this.subjectName}) : super(key: key);

  @override
  _SubjectInfoScreenState createState() => _SubjectInfoScreenState();
}

class _SubjectInfoScreenState extends State<SubjectInfoScreen> {
  String description =
      'A Human-Machine Interface (HMI) is a user interface or dashboard that connects a person to a machine, system, or device.';
  List<String> labList = <String>[
    'Human Machine Interaction Lab',
    'Distributed Computing Lab',
    'Cloud Computing Lab',
    'Human Machine Interaction Lab',
    'Distributed Computing Lab',
    'Cloud Computing Lab',
    'Human Machine Interaction Lab',
    'Distributed Computing Lab',
    'Cloud Computing Lab',
    'Computational Lab-II'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size.width,
            height: size.height,
          ),
          Container(
            width: size.width,
            height: size.height * 0.48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              color: Color(0xff91e6d5),
            ),
            child: Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.1, top: size.height * 0.09),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        width: size.width * 0.42,
                        child: Text(
                          widget.subjectName,
                          style: headingStyle,
                        ),
                      ),
                      Container(
                        width: size.width * 0.45,
                        child: Text(
                          description,
                          textAlign: TextAlign.left,
                          style: contentStyle,
                        ),
                      ),
                      Container(
                        width: size.width * 0.40,
                        margin: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 7,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              "Sem 8",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    top: -size.width * 0.14,
                    right: size.width * 0.03,
                    child: Container(
                      // color: Colors.red,
                      child: Image.asset(
                        'assets/images/hmi.png',
                        height: size.height * 0.45,
                        width: size.width * 0.52,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.44,
            left: 0,
            right: 0,
            child: Center(
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(40),
                child: SizedBox(
                  width: size.width * 0.9,
                  height: size.height * 0.55,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25, bottom: 20, left: 20, right: 10),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 0),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: labList.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 20.0,
                                  ),
                                  child: Material(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(30),
                                    elevation: 10,
                                    shadowColor: Colors.grey.shade300,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () => {},
                                        borderRadius: BorderRadius.circular(30),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          width: size.width,
                                          height: 50,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Container(
                                                    width: size.width * 0.6,
                                                    child: Text(
                                                      labList[index],
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        textStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: Icon(
                                                    Icons
                                                        .file_download_outlined,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: BackButton(
              color: Colors.white,
              onPressed: () => Navigator.maybePop(context),
            ),
          ),
        ],
      ),
    );
  }
}
