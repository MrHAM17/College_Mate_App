// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class Dashboard extends StatefulWidget {
//   String role;
//   Dashboard({Key? key, required this.role}) : super(key: key);
//
//   @override
//   _DashboardState createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   late List<StudentData> _chartData;
//   late TooltipBehavior _tooltipBehavior;
//
//   @override
//   void initState() {
//     _chartData = getChartData();
//     _tooltipBehavior = TooltipBehavior(
//       enable: true,
//       textStyle: GoogleFonts.montserrat(
//         textStyle: const TextStyle(
//             color: Colors.white,
//             fontSize: 12,
//             fontWeight: FontWeight.w500
//         ),
//       ),
//     );
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           leadingWidth: 35,
//           floating: false,
//           pinned: true,
//           centerTitle: true,
//           title: Text(
//             'Dashboard',
//             style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           expandedHeight: 285,
//           flexibleSpace: Container(
//             height: 310,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.topRight,
//                 colors: [
//                   Color(0xff43cea2),
//                   Color(0xff185a9d),
//                 ],
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: FlexibleSpaceBar(
//               background: Column(
//                 children: [
//                   SizedBox(
//                     height: 90,
//                   ),
//                   Text(
//                     'Subject wise Attendance - Sem 6 in Percentage',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600
//                     ),
//                   ),
//                   SizedBox(
//                     height: 200,
//                     child: SfCircularChart(
//                       tooltipBehavior: _tooltipBehavior,
//                       legend: Legend(
//                         position: LegendPosition.bottom,
//                         iconWidth: 20,
//                         iconHeight: 20,
//                         textStyle: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600
//                         ),
//                         iconBorderColor: Colors.white,
//                         isVisible: true,
//                       ),
//                       series: <CircularSeries>[
//                         PieSeries<StudentData, String>(
//                           dataSource: _chartData,
//                           xValueMapper: (StudentData data, _) => data.field,
//                           yValueMapper: (StudentData data, _) => data.percent,
//                           enableTooltip: true,
//                           dataLabelSettings: DataLabelSettings(isVisible: false),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SubjectSection(),
//         sliverPadding(),
//       ],
//     );
//   }
//
//   Widget SubjectSection() {
//     List<String> subject = <String>[
//       'Human Machine Interaction',
//       'Distributed Computing',
//       'Adhoc Wireless Network'
//     ];
//
//     List<String> prof = <String>[
//       'D.K. Chitre',
//       'Reshma Vartak',
//       'Archana Mire'
//     ];
//
//     return SliverToBoxAdapter(
//       child: Container(
//         margin: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Current Subjects",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: 3,
//               itemBuilder: (_, index) {
//                 return ListTile(
//                   leading: Icon(Icons.assignment_outlined),
//                   title: Text(subject[index]),
//                   subtitle: Text(prof[index]),
//                   trailing: Icon(Icons.navigate_next),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget sliverPadding() {
//     return SliverToBoxAdapter(
//       child: SizedBox(
//         height: 30,
//       ),
//     );
//   }
//
//   List<StudentData> getChartData() {
//     final List<StudentData> chartData = [
//       StudentData("AI", 75, '75%'),
//       StudentData("MC", 85, '85%'),
//       StudentData("SPCC", 70, '90%'),
//     ];
//     return chartData;
//   }
// }
//
// class StudentData {
//   StudentData(this.field, this.percent, this.percentage);
//   final String field;
//   final int percent;
//   final String percentage;
// }














import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../MODULES/Module_StudentProfile/profile.dart';

class Dashboard extends StatefulWidget {
  String role;
  Dashboard({Key? key, required this.role}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<StudentData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      textStyle: GoogleFonts.montserrat(
        textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500
        ),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(Icons.person, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(role: widget.role),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
          leadingWidth: 35,
          floating: false,
          pinned: true,
          centerTitle: true,
          title: Text(
            'Dashboard',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          expandedHeight: 285,
          flexibleSpace: Container(
            height: 310,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xff43cea2),
                  Color(0xff185a9d),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    'Subject wise Attendance - Sem 6 in Percentage',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: SfCircularChart(
                      tooltipBehavior: _tooltipBehavior,
                      legend: Legend(
                        position: LegendPosition.bottom,
                        iconWidth: 20,
                        iconHeight: 20,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                        ),
                        iconBorderColor: Colors.white,
                        isVisible: true,
                      ),
                      series: <CircularSeries>[
                        PieSeries<StudentData, String>(
                          dataSource: _chartData,
                          xValueMapper: (StudentData data, _) => data.field,
                          yValueMapper: (StudentData data, _) => data.percent,
                          enableTooltip: true,
                          dataLabelSettings: DataLabelSettings(isVisible: false),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SubjectSection(),
        sliverPadding(),
      ],
    );
  }

  Widget SubjectSection() {
    List<String> subject = <String>[
      'Human Machine Interaction',
      'Distributed Computing',
      'Adhoc Wireless Network'
    ];

    List<String> prof = <String>[
      'D.K. Chitre',
      'Reshma Vartak',
      'Archana Mire'
    ];

    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Subjects",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: Icon(Icons.assignment_outlined),
                  title: Text(subject[index]),
                  subtitle: Text(prof[index]),
                  trailing: Icon(Icons.navigate_next),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget sliverPadding() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 30,
      ),
    );
  }

  List<StudentData> getChartData() {
    final List<StudentData> chartData = [
      StudentData("AI", 75, '75%'),
      StudentData("MC", 85, '85%'),
      StudentData("SPCC", 70, '90%'),
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
