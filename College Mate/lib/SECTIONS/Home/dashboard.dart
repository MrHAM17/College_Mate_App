import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:college_mate/SECTIONS/Home/parallaxEffect.dart';
import 'package:college_mate/MODULES/Module_StudentProfile/profile_page.dart';
import 'package:college_mate/UTILS/constants/colors.dart';
import 'package:college_mate/UTILS/constants/textstyles.dart';
import 'package:college_mate/UTILS/imageview/imageViewer.dart';
import 'package:college_mate/UTILS/imageview/pdfreader.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );

    super.initState();
  }

  bool trigger = true;
  @override
  Widget build(BuildContext context) {
    if (widget.role == 'faculty') {
      trigger = false;
    }
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leadingWidth: 35,
          floating: false,
          pinned: true,
          centerTitle: true,
          title: Text(
            'Dashboard',
            style: headingStyle,
          ),
          actions: [
            IconButton(
              iconSize: 40,
              icon: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/myself.jpg')),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(role: widget.role)));
              },
            ),
          ],
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
                ]
            ),
            child: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    'Subject wise Attendance - Sem 6 in Percentage',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: SfCircularChart(
                      tooltipBehavior: _tooltipBehavior,
                      legend: Legend(
                          position: LegendPosition.bottom,
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
                          overflowMode: LegendItemOverflowMode.wrap),
                      series: <CircularSeries>[
                        PieSeries<StudentData, String>(
                            dataSource: _chartData,
                            xValueMapper: (StudentData data, _) => data.field,
                            yValueMapper: (StudentData data, _) => data.percent,
                            enableTooltip: true,
                            dataLabelSettings:
                                DataLabelSettings(isVisible: false))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SubjectSection(),
        Eventboard(),
        Noticeboard(),
        sliverPadding(),
        SliverToBoxAdapter(child: Parallax()),
        sliverPadding()
      ],
    );
  }

  // Widget DashSection(){

  // }

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

    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        height: size.height * 0.33,
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 4,
            ),
            trigger
                ? Text(
                    "Latest Pdf's",
                    style: h2,
                  )
                : Text(
                    "Current Subjects",
                    style: h2,
                  ),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return ListTile(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PdfReader())),
                  hoverColor: Colors.grey,
                  selectedTileColor: Colors.blue.shade300,
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Icon(
                        Icons.assignment_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                  title: Text(
                    subject[index],
                    style: whiteContentStyle,
                  ),
                  subtitle: Text(
                    prof[index],
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 30,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget Noticeboard() {
    var size = MediaQuery.of(context).size;
    return customContainer(Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Latest Notice',
            style: h2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: size.height * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "28.01.2022",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                            width: size.width * 0.25,
                            child: Text("Exam Notice", style: normalStyle)),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageViewer(
                            imgpath: 'assets/noticeImages/notice1.jpg'))),
                child: Container(
                  width: size.width * 0.5,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/noticeImages/notice1.jpg"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Widget Eventboard() {
    var size = MediaQuery.of(context).size;
    return customContainer(Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Latest Event',
              style: h2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height * 0.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "28.01.2022",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SizedBox(
                              width: size.width * 0.25,
                              child: Text("Syllogic 2019", style: normalStyle)),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageViewer(
                              imgpath: 'assets/events/event1.jpg'))),
                  child: Container(
                    width: size.width * 0.5,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/events/event1.jpg"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
    ));
  }

  Widget customContainer(Widget child) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        height: size.height * 0.27,
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5,
                offset: Offset(1, 1),
              ),
            ],
            color: backgroundColor),
        child: child,
      ),
    );
  }

  Widget GalleryBoard() {
    return SliverToBoxAdapter(
      child: Container(
        child: CarouselSlider(
          items: [
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.shiksha.com/mediadata/images/1628851912phpgLUq2f.jpeg'),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://ternaengg.ac.in/wp-content/uploads/2018/06/IMG_5878.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://www.collegebatch.com/static/clg-gallery/tpcts-terna-engineering-college-tec-navi-mumbai-55343.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
          ],
          options: CarouselOptions(
            height: 250,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
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
      StudentData("CSS", 90, '90%'),
      StudentData("IOT", 95, '95%'),
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
