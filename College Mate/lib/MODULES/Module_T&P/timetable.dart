import 'package:flutter/material.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({Key? key}) : super(key: key);

  @override
  _TimeTableScreenState createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  String department = "";
  int i = 1;
  var tstyle = const TextStyle(fontFamily: 'Montserrat-Bold', fontSize: 20);
  var fstyle = const TextStyle(
      fontFamily: 'Montserrat-Bold', fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var myFocusNode = FocusNode();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFf5efef),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset("assets/images/ternalogo.png"),
                height: size.height / 5,
                width: size.width,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF657FDC).withAlpha(150),
                        blurRadius: 8.0,
                        spreadRadius: 1.0,
                        offset: const Offset(
                          6.0,
                          8.0,
                        ),
                      ),
                    ]),
                child: Material(
                  color: const Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(30),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    child: Text(
                      "Terna Engineering College",
                      style: TextStyle(
                          fontSize: 22, fontFamily: 'Montserrat-Bold'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF657FDC).withAlpha(150),
                        blurRadius: 8.0,
                        spreadRadius: 1.0,
                        offset: const Offset(
                          6.0,
                          8.0,
                        ),
                      ),
                    ]),
                child: Material(
                  color: const Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(30),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                    child: Text(
                      "Timetable",
                      style: TextStyle(
                          fontSize: 22, fontFamily: 'Montserrat-Bold'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:size.height*0.05,
              ),
              Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      width: size.width * 0.82,
                      height: size.height*0.8,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                      ),
                      child: Expanded(
                        child: 
                          
                         new Icon(Icons.image_outlined),
                        ),
                      ),
                    ),
                  
            ],
        ),
      ),
    ),);
    
  
              
  }
}