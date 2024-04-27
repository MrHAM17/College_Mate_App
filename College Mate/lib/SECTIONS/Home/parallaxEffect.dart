import 'package:flutter/material.dart';
import 'package:college_mate/UTILS/constants/textstyles.dart';

class Parallax extends StatefulWidget {
  @override
  _ParallaxState createState() => _ParallaxState();
}

class _ParallaxState extends State<Parallax> {
  late PageController pageController;
  double pageOffset = 0;

  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  List<String> events = <String>[
    'Shiva Parvati - Play',
    'Blue Dancer Group',
    'Hip Hop Group',
    'Blood Donation Drive',
    'Ganpati Visarjan'
  ];

  List<Map> paintings = [
    {
      'image': 'assets/gallery/gallery1.jpg',
    },
    {
      'image': 'assets/gallery/gallery2.jpg',
    },
    {
      'image': 'assets/gallery/gallery3.jpg',
    },
    {
      'image': 'assets/gallery/gallery4.jpg',
    },
    {
      'image': 'assets/gallery/gallery5.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 400,
            padding: EdgeInsets.only(bottom: 30),
            child: PageView.builder(
              itemCount: paintings.length,
              controller: pageController,
              itemBuilder: (context, i) {
                return Transform.scale(
                  scale: 1,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            paintings[i]['image'],
                            height: 370,
                            fit: BoxFit.cover,
                            alignment: Alignment(-pageOffset.abs() + i, 0),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 0,
                          right: 0,
                          child: Material(
                            elevation: 3,
                            color: Colors.transparent,
                            child: Container(
                              width: size.width,
                              height: 35,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  events[i],
                                  textAlign: TextAlign.center,
                                  style: normalStyle,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
