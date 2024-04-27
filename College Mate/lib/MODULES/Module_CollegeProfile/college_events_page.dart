

import 'package:flutter/material.dart';
import 'package:college_mate/UTILS/constants/colors.dart';
import 'package:college_mate/UTILS/imageview/imageViewer.dart';

class EventsPage extends StatefulWidget {

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
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
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
                    "Campus Events",
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
