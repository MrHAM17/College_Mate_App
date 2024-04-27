import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int flag = 8;
  late AnimationController _controller;

  void initState() {
    super.initState();

    _controller = AnimationController(
        upperBound: 1,
        lowerBound: 0.1,
        vsync: this,
        duration: Duration(milliseconds: 2000))
      ..repeat(reverse: true);

    _controller.addListener(() {});
  }

  List<Color> _color = <Color>[
    Color(0xff794afd),
    Color(0xff64eda9),
    Color(0xffe71c5e)
  ];
  List<Widget> pages = <Widget>[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
    Screen5()
  ];
  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return Container(
        child: LiquidSwipe(
      pages: pages,
      slideIconWidget: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: 40,
        ),
      ),
      enableLoop: true,
      positionSlideIcon: 0.8,
      fullTransitionValue: 800,
      waveType: WaveType.liquidReveal,
      enableSideReveal: false,
    ));
  }
}

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  int flag = 8;
  late AnimationController _controller;

  late Animation<Offset> _animation;

  void initState() {
    super.initState();

    _controller = AnimationController(
        upperBound: 1,
        lowerBound: 0.1,
        vsync: this,
        duration: Duration(milliseconds: 2000))
      ..repeat(reverse: true);

    _controller.addListener(() {});

    _animation =
        Tween(begin: Offset.zero, end: Offset(0.01, 0.01)).animate(_controller);
  }

  final TextStyle _textStyle = GoogleFonts.tenorSans(
      textStyle: TextStyle(
    letterSpacing: 1.8,
    fontSize: 18,
  ));
  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Color white = Colors.white;
    Color black = Colors.black;
    return Container(
      height: size.height,
      width: size.width,
      color: Color(0xff794afd),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SlideTransition(
                  position: _animation,
                  child:
                      Image(image: AssetImage("assets/images/groupstudy.png"))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Incubation Center",
                    style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                          color: white,
                          fontSize: 30.5,
                          letterSpacing: 5,
                          wordSpacing: 5,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                height: size.height * 0.27,
                width: size.width * 0.77,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: black.withOpacity(0.3),
                        blurRadius: 30.0,
                        offset: Offset(10, 15),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Text(
                        "As we read out the Elon Musks “Space-X” program in newspaper or scroll through “Facebook” or doing online shopping using “Flipkart”, our world has been changed by “Start-up” community, determined entrepreneurs of this era are changing the world. We encourage our students and an alumnus’s to take up an entrepreneurial route to success. Our Incubation Centre is the runway for student’s flight towards making a dent in the Universe.",
                        style: _textStyle,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> with SingleTickerProviderStateMixin {
  int flag = 8;
  late AnimationController _controller;

  late Animation<Offset> _animation;

  void initState() {
    super.initState();

    _controller = AnimationController(
        upperBound: 1,
        lowerBound: 0.1,
        vsync: this,
        duration: Duration(milliseconds: 2000))
      ..repeat(reverse: true);

    _controller.addListener(() {});

    _animation =
        Tween(begin: Offset.zero, end: Offset(0.01, 0.01)).animate(_controller);
  }

  final TextStyle _textStyle = GoogleFonts.tenorSans(
      textStyle: TextStyle(
    letterSpacing: 1.8,
    fontSize: 16,
  ));
  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Color white = Colors.white;
    Color black = Colors.black;
    return Container(
      color: Color(0xff64eda9),
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          SlideTransition(
              position: _animation,
              child: Image(image: AssetImage("assets/images/Collegeexam.png"))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("NPTEL ",
                    style: GoogleFonts.exo2(
                      textStyle: TextStyle(
                          color: white,
                          fontSize: 30.5,
                          letterSpacing: 1.5,
                          wordSpacing: 5,
                          fontWeight: FontWeight.bold),
                    )),
                Text("Study Center",
                    style: GoogleFonts.lobster(
                      textStyle: TextStyle(
                          color: white,
                          fontSize: 30.5,
                          letterSpacing: 5,
                          wordSpacing: 5,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            height: size.height * 0.27,
            width: size.width * 0.77,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.3),
                    blurRadius: 30.0,
                    offset: Offset(10, 15),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Scrollbar(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NPTEL provides E-learning through online Web and Video courses various streams.",
                      style: GoogleFonts.tenorSans(
                          textStyle: TextStyle(
                        letterSpacing: 1.8,
                        fontSize: 16,
                      )),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "•Total Enrollment: 1487",
                      style: _textStyle,
                    ),
                    Text(
                      "•Total exam registration: 87",
                      style: _textStyle,
                    ),
                    Text(
                      "•Total students appeared for exams: 81",
                      style: _textStyle,
                    ),
                    Text(
                      "•Total successful Students: 70",
                      style: _textStyle,
                    ),
                    Text(
                      "•Total Toppers on national level: 06",
                      style: _textStyle,
                    )
                  ],
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> with SingleTickerProviderStateMixin {
  int flag = 8;
  late AnimationController _controller;

  late Animation<Offset> _animation;

  void initState() {
    super.initState();

    _controller = AnimationController(
        upperBound: 1,
        lowerBound: 0.1,
        vsync: this,
        duration: Duration(milliseconds: 2000))
      ..repeat(reverse: true);

    _controller.addListener(() {});

    _animation =
        Tween(begin: Offset.zero, end: Offset(0.01, 0.01)).animate(_controller);
  }

  final TextStyle _textStyle = GoogleFonts.tenorSans(
      textStyle: TextStyle(
    letterSpacing: 1.8,
    fontSize: 16,
  ));
  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Color white = Colors.white;
    Color black = Colors.black;
    return Container(
      color: Color(0xffe71c5e),
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          SlideTransition(
              position: _animation,
              child: Image(image: AssetImage("assets/images/library.png"))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Research Center",
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                      color: white,
                      fontSize: 30.5,
                      letterSpacing: 5,
                      wordSpacing: 5,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            height: size.height * 0.27,
            width: size.width * 0.77,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.3),
                    blurRadius: 30.0,
                    offset: Offset(10, 15),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Text(
                    "Terna Engineering College, strives to encourage creative work, innovation and design thinking in enthusiastic young minds. TEC has made rigorous efforts to promote R&D at various echelons. Students and faculty conduct research projects in thrust areas of engineering.",
                    style: _textStyle,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> with SingleTickerProviderStateMixin {
  int flag = 8;
  late AnimationController _controller;

  late Animation<Offset> _animation;

  void initState() {
    super.initState();

    _controller = AnimationController(
        upperBound: 1,
        lowerBound: 0.1,
        vsync: this,
        duration: Duration(milliseconds: 2000))
      ..repeat(reverse: true);

    _controller.addListener(() {});

    _animation =
        Tween(begin: Offset.zero, end: Offset(0.01, 0.01)).animate(_controller);
  }

  final TextStyle _textStyle = GoogleFonts.tenorSans(
      textStyle: TextStyle(
    letterSpacing: 1.8,
    fontSize: 18,
  ));
  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Color white = Colors.white;
    Color black = Colors.black;
    return Container(
      height: size.height,
      width: size.width,
      color: Color(0xfffbfe00),
      child: Column(
        children: [
          SlideTransition(
              position: _animation,
              child: Image(image: AssetImage("assets/images/elearning.png"))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("E-Learning",
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                      color: Colors.cyan,
                      fontSize: 33.5,
                      letterSpacing: 5,
                      wordSpacing: 5,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            height: size.height * 0.27,
            width: size.width * 0.77,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.3),
                    blurRadius: 30.0,
                    offset: Offset(10, 15),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Key Features:-",
                        style: GoogleFonts.tenorSans(
                            textStyle: TextStyle(
                                letterSpacing: 1.8,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "•Interactive and engaging learning modules",
                        style: _textStyle,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "•Visually rich content to enable conceptual clarity and lifelong term retention",
                        style: _textStyle,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "•Personalised learning programs designed for every student, enabled by the power of data science",
                        style: _textStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Screen5 extends StatefulWidget {
  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> with SingleTickerProviderStateMixin {
  int flag = 8;
  late AnimationController _controller;

  late Animation<Offset> _animation;

  void initState() {
    super.initState();

    _controller = AnimationController(
        upperBound: 1,
        lowerBound: 0.1,
        vsync: this,
        duration: Duration(milliseconds: 2000))
      ..repeat(reverse: true);

    _controller.addListener(() {});

    _animation =
        Tween(begin: Offset.zero, end: Offset(0.01, 0.01)).animate(_controller);
  }

  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Color white = Colors.white;
    Color black = Colors.black;
    return Container(
      height: size.height,
      width: size.width,
      color: Color(0xfffb504d),
      child: Column(
        children: [
          SlideTransition(
              position: _animation,
              child: Image(image: AssetImage("assets/images/epic.png"))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("EPIC",
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                      color: white,
                      fontSize: 33.5,
                      letterSpacing: 5,
                      wordSpacing: 5,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            height: size.height * 0.27,
            width: size.width * 0.77,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.3),
                    blurRadius: 30.0,
                    offset: Offset(10, 15),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Text(
                    "EPIC is aligned with the mission of the Terna Engineering College to create societal engineers who are prepared to step up to the ever growing need in the India, and abroad, for industry leaders who understand how to develop and manufacture innovative new products in a global environment.",
                    style: GoogleFonts.tenorSans(
                        textStyle: TextStyle(
                      letterSpacing: 1.8,
                      fontSize: 18,
                    )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
