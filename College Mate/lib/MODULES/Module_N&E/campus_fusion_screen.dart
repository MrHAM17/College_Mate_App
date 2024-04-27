//
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:college_mate/constants/colors.dart';
// import 'package:college_mate/constants/textstyles.dart';
// import 'package:college_mate/imageview/imageViewer.dart';
//
// class CampusFusionScreen extends StatefulWidget {
//   String role;
//   CampusFusionScreen({Key? key, required this.role}) : super(key: key);
//
//   List<String> title = <String>[
//     "Exam Notice",
//     "DSE SEM III Exam Timetable",
//     "Updated fees for FE & DSE",
//     "Student Council 2021-22",
//     "Ph.D. Admission 2021-2022"
//   ];
//
//   List<String> date = <String>[
//     '28.01.2022',
//     '24.01.2022',
//     '27.12.2021',
//     '24.01.2022',
//     '15.12.2021'
//   ];
//
//   List<String> image = <String>[
//     'assets/noticeImages/notice1.jpg',
//     'assets/noticeImages/notice2.jpg',
//     'assets/noticeImages/notice3.jpg',
//     'assets/noticeImages/notice4.jpg',
//     'assets/noticeImages/notice5.jpg'
//   ];
//
//   List<String> events = [
//     'NSS',
//     'REVIVE',
//     'RESONANCE',
//     'ATRANG',
//     'Fests',
//     'Events',
//     'Activites',
//     'Computer',
//     'IT',
//     'AIDS',
//     'EXTC',
//     'Civil',
//     'Mechanic',
//     'Mechatronics'
//   ];
//
//   List<String> years = ['2021', '2022', '2023', '2024'];
//
//   @override
//   _CampusFusionScreenState createState() => _CampusFusionScreenState();
// }
//
// class _CampusFusionScreenState extends State<CampusFusionScreen> {
//   late String selectedEvent;
//   late String selectedYear;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedEvent = widget.events.first;
//     selectedYear = widget.years.first;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//
//     return DefaultTabController(
//       length: 2,
//       child: NestedScrollView(
//         floatHeaderSlivers: true,
//         headerSliverBuilder: (context, value) {
//           return [
//             SliverAppBar(
//               pinned: false,
//               floating: true,
//               collapsedHeight: 60,
//               toolbarHeight: 50,
//               leadingWidth: 56,
//               centerTitle: true,
//               title: Text(
//                 "CampusFusion",
//                 style: headingStyle,
//               ),
//               backgroundColor: Colors.cyan,
//               flexibleSpace: FlexibleSpaceBar(
//                 background: Container(
//                   width: 40,
//                   decoration: BoxDecoration(gradient: customLinearGradient()),
//                 ),
//               ),
//               bottom: TabBar(
//                 labelStyle: tabStyle,
//                 indicatorColor: Colors.white,
//                 indicatorWeight: 3,
//                 tabs: [
//                   Tab(
//                     text: "Select Event",
//                     icon: Icon(Icons.event),
//                   ),
//                   Tab(
//                     text: "Select Year",
//                     icon: Icon(Icons.calendar_today),
//                   ),
//                 ],
//               ),
//               elevation: 20,
//               titleSpacing: 20,
//             ),
//           ];
//         },
//         body: TabBarView(
//           children: [
//             ListView.builder(
//               itemCount: widget.events.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(widget.events[index]),
//                   onTap: () {
//                     setState(() {
//                       selectedEvent = widget.events[index];
//                     });
//                   },
//                   selected: selectedEvent == widget.events[index],
//                   selectedTileColor: Colors.grey[200],
//                 );
//               },
//             ),
//             ListView.builder(
//               itemCount: widget.years.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(widget.years[index]),
//                   onTap: () {
//                     setState(() {
//                       selectedYear = widget.years[index];
//                     });
//                   },
//                   selected: selectedYear == widget.years[index],
//                   selectedTileColor: Colors.grey[200],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   LinearGradient customLinearGradient() {
//     return const LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.topRight,
//       colors: [
//         Color(0xff43cea2),
//         Color(0xff185a9d),
//       ],
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:college_mate/UTILS/constants/colors.dart';
import 'package:college_mate/UTILS/imageview/imageViewer.dart';

class CampusFusionScreen extends StatefulWidget {
  String role;
  CampusFusionScreen({Key? key, required this.role}) : super(key: key);

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

  List<String> eventsAndActivities = [
    'All',
    'ATRANG',
    'Events',
    'Fests',
    'NSS',
    'REVIVE',
    'RESONANCE',

    'AIDS',
    'Civil',
    'Computer',
    'EXTC',
    'IT',
    'Mechanic',
    'Mechatronics',
  ];

  List<String> years = ['2021', '2022', '2023', '2024'];

  @override
  _CampusFusionScreenState createState() => _CampusFusionScreenState();
}

class _CampusFusionScreenState extends State<CampusFusionScreen> {
  late String selectedEvent;
  late String selectedYear;

  @override
  void initState() {
    super.initState();
    selectedEvent = widget.eventsAndActivities.first;
    selectedYear = widget.years.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Custom Card
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: customLinearGradient(),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
              padding: EdgeInsets.all(26),
              child: Column(
                children: [
                  Text(
                    "Campus Fusion",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          _showEventSelectionDialog();
                        },
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        label: Text('$selectedEvent'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(10),

                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _showYearSelectionDialog();
                        },
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        label: Text('$selectedYear'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                        },
                        child: Icon(Icons.check, color: Colors.black),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.white,
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height:1),
            // Placeholder for fetching data from Firebase
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.title.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.title[index]),
                  subtitle: Text(widget.date[index]),
                  onTap: () {
                    _showNoticeDetails(index);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _showEventSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Event'),
          content: SingleChildScrollView(
            child: ListBody(
              children: widget.eventsAndActivities.map((event) {
                return ListTile(
                  title: Text(event),
                  onTap: () {
                    setState(() {
                      selectedEvent = event;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  _showYearSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Year'),
          content: SingleChildScrollView(
            child: ListBody(
              children: widget.years.map((year) {
                return ListTile(
                  title: Text(year),
                  onTap: () {
                    setState(() {
                      selectedYear = year;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  _showNoticeDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageViewer(
          imgpath: widget.image[index],
        ),
      ),
    );
  }

  LinearGradient customLinearGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: [
        Color(0xff43cea2),
        Color(0xff185a9d),
      ],
    );
  }
}
