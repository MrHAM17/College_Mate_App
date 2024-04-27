import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:college_mate/UTILS/constants/colors.dart';
import 'package:college_mate/UTILS/constants/textstyles.dart';
import 'package:college_mate/UTILS/imageview/imageViewer.dart';

class NoticeScreen extends StatefulWidget {
  String role;
  NoticeScreen({Key? key, required this.role}) : super(key: key);

  List<String> title = <String>[
    "Exam Notice",
    "DSE SEM III Exam Timetable",
    "Updated fees for FE & DSE",
    "Student Council 2021-22",
    "Ph.D. Admission 2021-2022"
  ];

  List<String> date = <String>[
    '28.01.2022',
    '24.01.2022',
    '27.12.2021',
    '24.01.2022',
    '15.12.2021'
  ];

  List<String> image = <String>[
    'assets/noticeImages/notice1.jpg',
    'assets/noticeImages/notice2.jpg',
    'assets/noticeImages/notice3.jpg',
    'assets/noticeImages/notice4.jpg',
    'assets/noticeImages/notice5.jpg'
  ];

  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  @override
  Widget build(BuildContext context) {
    bool trigger = true;
    if (widget.role == 'faculty') {
      trigger = false;
    }
    var size = MediaQuery.of(context).size;

    return DefaultTabController(
        length: trigger ? 3 : 2,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                pinned: false,
                floating: true,
                collapsedHeight: 60,
                toolbarHeight: 50,
                leadingWidth: 56,
                centerTitle: true,
                title: Text(
                  "CampusFusion",
                  style: headingStyle,
                ),
                backgroundColor: Colors.cyan,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    width: 40,
                    decoration: BoxDecoration(gradient: customLinearGradient()),
                  ),
                ),
                bottom: trigger
                    ? TabBar(
                        labelStyle: tabStyle,
                        indicatorColor: Colors.white,
                        indicatorWeight: 3,
                        tabs: [
                          Tab(
                            text: "Admin",
                            icon: Icon(
                              Icons.face_retouching_natural,
                              size: 25,
                            ),
                          ),
                          Tab(
                            text: "Faculty",
                            icon: Icon(Icons.group_outlined),
                          ),
                          Tab(
                            text: "CR",
                            icon: Icon(Icons.how_to_reg_outlined),
                          ),
                        ],
                      )
                    : TabBar(
                        labelStyle: tabStyle,
                        indicatorColor: Colors.white,
                        indicatorWeight: 3,
                        tabs: [
                          Tab(
                            text: "Admin",
                            icon: Icon(Icons.face_retouching_natural),
                          ),
                          Tab(
                            text: "Faculty",
                            icon: Icon(Icons.group_outlined),
                          ),
                        ],
                      ),
                elevation: 20,
                titleSpacing: 20,
              ),
            ];
          },
          body: trigger
              ? TabBarView(children: [
                  buildPage('Admin notice'),
                  buildPage('Faculty notice'),
                  buildPage('CR notice'),
                ])
              : TabBarView(children: [
                  buildPage('Admin notice'),
                  buildPage('Faculty notice'),
                ]),
        ));
  }

  LinearGradient customLinearGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: [
        // Color(0xffB1097C),
        // Color(0xff0947B1),
        Color(0xff43cea2),
        Color(0xff185a9d),
      ],
    );
  }

  Widget buildPage(String text) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
        padding: EdgeInsets.only(top: 15),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (_, index) {
          if (text == 'Faculty notice') return noticeSection(4 - index);
          return noticeSection(index);
        });
  }

  Widget noticeSection(int index) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.35,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Lottie.asset("assets/lottie/waves.json",
              width: size.width, height: size.height * 0.3),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Center(
              child: noticeCard(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget noticeCard(int index) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.32,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black54, blurRadius: 10, offset: Offset(3, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(widget.title[index], style: cardTitleStyle),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(widget.date[index], style: cardTitleStyle),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ImageViewer(imgpath: widget.image[index]),
                ),
              ),
              child: Container(
                width: size.width * 0.82,
                height: 180,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(widget.image[index]),
                        fit: BoxFit.fill)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
