import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mech_it/UTILS/constants/colors.dart';
import 'package:mech_it/UTILS/constants/textstyles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FeeScreen extends StatefulWidget {
  @override
  _FeeScreenState createState() => _FeeScreenState();
}

class _FeeScreenState extends State<FeeScreen> {
  late List<StudentData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  List<String> title = <String>[
    'Name',
    'Class',
    'Semester',
    'Year',
    'Fees Category'
  ];
  List<String> particulars = <String>[
    'Tuition Fee',
    'Exam Fee',
    'Alumini',
    'LMS',
    'Development Fees',
    'Convocation Fees',
    'Total Fees',
  ];
  List<String> fees = <String>[
    '72,376 	₹',
    '2,207	₹',
    '500	₹',
    '7,800 	₹',
    '10,000 	₹',
    '8,117 	₹',
    '1,00,000 	₹'
  ];
  List<String> content = <String>[
    'Harsh Minde',
    'TE - C',
    'VI',
    '2021',
    'General'
  ];

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      textStyle: GoogleFonts.montserrat(
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffd8e8e5),
      body: CustomScrollView(physics: NeverScrollableScrollPhysics(), slivers: [
        SliverAppBar(
          pinned: true,
          leadingWidth: 30,
          floating: true,
          centerTitle: true,
          title: Text("Fees"),
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
          elevation: 20,
          titleSpacing: 20,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: size.height * 0.1,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.78,
                      decoration: BoxDecoration(
                        color: secondaryBG,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: size.width * 0.8,
                          height: size.height * 0.18,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: title.length,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return Text(
                                  "${title[index]} : ${content[index]}",
                                  textAlign: TextAlign.center,
                                  style: tabStyle,
                                );
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: size.width * 0.8,
                          height: size.height * 0.65,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8, right: 8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.15,
                                      child: Text("Sr no",
                                          textAlign: TextAlign.center,
                                          style: contentStyle),
                                    ),
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: VerticalDivider(
                                        thickness: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                        width: size.width * 0.28,
                                        child: Text('Particular',
                                            textAlign: TextAlign.center,
                                            style: contentStyle)),
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: VerticalDivider(
                                        thickness: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                        width: size.width * 0.20,
                                        child: Text('Fee',
                                            textAlign: TextAlign.center,
                                            style: contentStyle))
                                  ],
                                ),
                                ListView.builder(
                                    padding: EdgeInsets.only(),
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: fees.length,
                                    shrinkWrap: true,
                                    itemBuilder: (_, index) {
                                      return Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: size.width * 0.15,
                                              child: Text(
                                                "${index + 1}",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                              height: 35,
                                              child: VerticalDivider(
                                                thickness: 2,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.28,
                                              child: Text(
                                                particulars[index],
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                              height: 35,
                                              child: VerticalDivider(
                                                thickness: 2,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.20,
                                              child: Text(
                                                fees[index],
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Text(
                                      'Fees Report',
                                      style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 180,
                                      child: SfCircularChart(
                                        tooltipBehavior: _tooltipBehavior,
                                        legend: Legend(
                                            position: LegendPosition.auto,
                                            iconWidth: 20,
                                            isResponsive: true,
                                            iconHeight: 20,
                                            textStyle: GoogleFonts.montserrat(
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            iconBorderColor: Colors.white,
                                            isVisible: true,
                                            overflowMode:
                                                LegendItemOverflowMode.wrap),
                                        series: <CircularSeries>[
                                          PieSeries<StudentData, String>(
                                              dataSource: _chartData,
                                              xValueMapper:
                                                  (StudentData data, _) =>
                                                      data.field,
                                              yValueMapper:
                                                  (StudentData data, _) =>
                                                      data.percent,
                                              enableTooltip: true,
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                      isVisible: false))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  List<StudentData> getChartData() {
    final List<StudentData> chartData = [
      StudentData("Due Fees", 33000, '33%'),
      StudentData("Paid Fees", 67000, '67%'),
    ];
    return chartData;
  }
}

class StudentData {
  StudentData(this.field, this.percent, this.percentage);
  final String field;
  final int percent;
  final String percentage;
}
