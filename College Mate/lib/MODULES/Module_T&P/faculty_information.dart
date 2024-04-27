import 'package:flutter/material.dart';

class FacultyList extends StatefulWidget {
  const FacultyList({Key? key}) : super(key: key);

  @override
  _FacultyListState createState() => _FacultyListState();
}

class _FacultyListState extends State<FacultyList> {
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
                      "Faculty Information",
                      style: TextStyle(
                          fontSize: 22, fontFamily: 'Montserrat-Bold'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade400,
                    child: InkWell(
                      onTap: () => {},
                      splashColor: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: size.width / 1.8,
                        height: 60,
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            isDense: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              fillColor: Colors.black,
                              labelText: 'Dept',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.blue
                                      : Colors.black,
                                  fontFamily: 'Montserrat-Bold',
                                  fontSize: 18),
                            ),
                            items: [
                              "Computer Engineering",
                              "Information Technology",
                              "Civil",
                              "EXTC",
                              "Electronics",
                              "Instrumentation",
                              "Mechanical",
                              "Mechatronics"
                            ]
                                .map((label) => DropdownMenuItem(
                                      child: Text(label),
                                      value: label,
                                    ))
                                .toList(),
                            onChanged: (value) {
                              department = value.toString();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      splashColor: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => {setState(() {})},
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                          child: const Icon(
                            Icons.search_outlined,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: size.width * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  color: const Color(0xFF2BC3D1),
                ),
                child: Center(
                  child: Text(
                    department,
                    style: tstyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  width: size.width * 0.85,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    itemBuilder: (_, index) {
                      i = index + 1;
                      return Container(
                        height: 170,
                        width: size.width * 0.85,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Name : ",
                                        style: fstyle,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Subject : ",
                                        style: fstyle,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Post : ",
                                        style: fstyle,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Email : ",
                                        style: fstyle,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Ravi Dubey",
                                        style: fstyle,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Mechanics",
                                        style: fstyle,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Teaching Faculty",
                                        style: fstyle,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "ravidubey25@gmail.com",
                                        style: fstyle,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              
                              
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
