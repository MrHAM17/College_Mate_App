import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:college_mate/UTILS/constants/colors.dart';
import 'package:college_mate/UTILS/constants/textstyles.dart';
import 'package:college_mate/UTILS/imageview/imageViewer.dart';

// import 'image_screen.dart';
import 'package:college_mate/UTILS/gallery/image_screen.dart';


class GalleryScreen extends StatefulWidget {
  GalleryScreen({Key? key}) : super(key: key);

  List<String> title = <String>[
    "Syllogic 2019",
    "Resonance 2K19",
    "Yuva Youth Fest",
    "Spazio 2K19",
    "Freshers 2K19"
  ];

  List<String> date = <String>[
    '28.01.2022',
    '24.01.2022',
    '27.12.2021',
    '24.01.2022',
    '15.12.2021'
  ];

  List<String> image = <String>[
    'assets/events/event1.jpg',
    'assets/events/event2.jpg',
    'assets/events/event3.jpg',
    'assets/events/event4.jpg',
    'assets/events/event5.jpg'
  ];

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.cyan,
              leadingWidth: 30,
              floating: true,
              title: Text(
                "Gallery",
                style: headingStyle,
              ),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xff43cea2),
                    Color(0xff185a9d),
                  ],
                )),
              ),
              bottom: TabBar(
                labelStyle: tabStyle,
                indicatorColor: Colors.white,
                indicatorWeight: 5,
                tabs: [
                  Tab(
                    text: "Event",
                    icon: Icon(Icons.event_outlined),
                  ),
                  Tab(
                    text: "Gallery",
                    icon: Icon(Icons.image_outlined),
                  ),
                ],
              ),
              elevation: 20,
              titleSpacing: 20,
            ),
          ],
          body: TabBarView(children: [
            eventPage('Admin notice'),
            galleryPage('Faculty notice'),
          ]),
        ));
  }

  Widget eventPage(String text) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (_, index) {
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
                          ImageViewer(imgpath: widget.image[index]))),
              child: Container(
                width: size.width * 0.82,
                height: 180,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(15),
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

  Widget galleryPage(String text) {
    List<String> images = <String>[
      'assets/gallery/gallery1.jpg',
      'assets/gallery/gallery2.jpg',
      'assets/gallery/gallery3.jpg',
      'assets/gallery/gallery4.jpg',
      'assets/gallery/gallery5.jpg',
    ];
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: 5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            var flag = true;
            if (index % 2 == 0)
              flag = false;
            else
              flag = true;
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: size.height * 0.14,
                  width: size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Container(
                            width: size.width * 0.27,
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ImageViewer(
                                    imgpath: flag
                                        ? images[3 - index]
                                        : images[index],
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade200,
                                    image: DecorationImage(
                                        image: AssetImage(flag
                                            ? images[3 - index]
                                            : images[index]),
                                        fit: BoxFit.fill)),
                                height: size.height * 0.14,
                                width: size.width * 0.27,
                              ),
                            ),
                          ),
                        );
                      }),
                ));
          },
        ),
      ),
    );
  }
}
