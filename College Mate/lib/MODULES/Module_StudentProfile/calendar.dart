import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mech_it/UTILS/constants/colors.dart';
import 'package:mech_it/UTILS/constants/textstyles.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class Event {
  final String title;
  final String content;
  Event({required this.title, required this.content});
}

class _CalendarState extends State<Calendar> {
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  CalendarFormat format = CalendarFormat.month;
  Map<DateTime, List<Event>> selectedEvents = {
    DateTime.now(): [Event(title: "holiday", content: 'chutti hai aaj')]
  };
  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventFromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverAppBar(
            floating: false,
            title: const Text(
              "Calendar",
              style: TextStyle(
                  fontFamily: 'Montserrat-Bold',
                  fontSize: 20,
                  color: Colors.white),
            ),
            pinned: true,
            centerTitle: true,
            backgroundColor: Colors.blue,
            elevation: 20,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: customLinearGradient(),
              ),
              child: const FlexibleSpaceBar(
                centerTitle: true,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime(2000),
                      lastDay: DateTime(2050),
                      focusedDay: DateTime.now(),
                      calendarFormat: format,
                      weekendDays: [],
                      daysOfWeekHeight: 22,
                      daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          weekendStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),

                      calendarStyle: CalendarStyle(
                        markerDecoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.purple),
                        todayDecoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        isTodayHighlighted: true,
                        holidayDecoration: const BoxDecoration(
                            color: Colors.transparent, shape: BoxShape.circle),
                        holidayTextStyle: TextStyle(color: Colors.red.shade900),
                        selectedDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: customLinearGradient(),
                        ),
                        selectedTextStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),

                      calendarBuilders: CalendarBuilders(
                        dowBuilder: (context, day) {
                          if (day.weekday == DateTime.sunday) {
                            final text = DateFormat.E().format(day);

                            return Center(
                              child: Text(
                                text,
                                style: TextStyle(
                                    color: Colors.red.shade900,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15),
                              ),
                            );
                          }
                        },
                      ),
                      headerStyle: HeaderStyle(
                          headerPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                          titleTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w400),
                          decoration: BoxDecoration(
                            gradient: customLinearGradient(),
                          ),
                          titleCentered: true,
                          formatButtonVisible: false),
                      holidayPredicate: (DateTime day) {
                        if (day.weekday == DateTime.sunday) {
                          return true;
                        } else {
                          return false;
                        }
                      },

                      //Events and all non style part

                      onFormatChanged: (CalendarFormat _format) {
                        setState(
                          () {
                            format = _format;
                          },
                        );
                      },
                      selectedDayPredicate: (day) =>
                          isSameDay(selectedDay, day),
                      onDaySelected: (DateTime selectDay, DateTime focusDay) =>
                          setState(
                        () {
                          focusedDay = focusDay;
                          selectedDay = selectDay;
                        },
                      ),
                      eventLoader: _getEventFromDay,
                    ),
                    ..._getEventFromDay(selectedDay).map(
                      (Event event) => ExpansionTile(
                        backgroundColor: backgroundColor,
                        collapsedBackgroundColor: backgroundColor,
                        title: Text(
                          event.title,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        children: [
                          Text(
                            "Additional Content",
                            textAlign: TextAlign.left,
                            style: whiteContentStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, right: 10, left: 10),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque mattis arcu at sapien cursus, a pretium nunc lobortis. Nunc cursus luctus erat sed ullamcorper. Integer dictum in erat vel viverra. Nunc sed laoreet lorem. Maecenas luctus bibendum lobortis. Suspendisse velit sem, lacinia vitae augue sit amet, rutrum tristique orci.",
                              style: contentStyle,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Enter Title"),
              content: TextFormField(
                controller: _eventController,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    if (_eventController.text.isEmpty) {
                      Navigator.pop(context);
                      return;
                    } else {
                      if (selectedEvents[selectedDay] != null) {
                        selectedEvents[selectedDay]!.add(Event(
                            title: _eventController.text, content: "testing"));
                      } else {
                        selectedEvents[selectedDay] = [
                          Event(
                              title: _eventController.text, content: "testing")
                        ];
                      }
                    }
                    _eventController.clear();
                    Navigator.pop(context);
                    setState(() {});
                    return;
                  },
                  child: const Text("Ok"),
                ),
              ],
            ),
          ),
        },
        label: const Text("Add Event"),
        icon: const Icon(
          Icons.add_outlined,
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
