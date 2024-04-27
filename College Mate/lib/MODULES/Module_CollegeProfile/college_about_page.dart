import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';

import 'package:lottie/lottie.dart';
import 'package:college_mate/MODULES/Module_CollegeProfile/writtencontent.dart';
import 'package:college_mate/UTILS/constants/colors.dart';
import 'package:college_mate/UTILS/constants/textstyles.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          gradientPadding(),
          SliverAppBar(
            floating: false,
            pinned: false,
            centerTitle: true,
            expandedHeight: 200,
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: customLinearGradient()),
              child: FlexibleSpaceBar(
                centerTitle: true,
                background: CarouselSlider(
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
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ),
            ),
          ),
          presidentSection(),
          principalSection(),
          missionSection(),
          visionSection(),
          departmentSection(),
          policySection(),
          valueSection(),
          contactSection(),
          locationSection(),
        ],
      ),
    );
  }

  Widget gradientPadding() {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        height: size.height * 0.03,
        decoration: BoxDecoration(gradient: customLinearGradient()),
      ),
    );
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

  presidentSection() {
    Size size = MediaQuery.of(context).size;
    return SliverStickyHeader(
      overlapsContent: false,
      sticky: true,
      header: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xff43cea2),
              Color(0xff185a9d),
            ],
          ),
        ),
        height: size.height * 0.08,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: Text(
          'President',
          style: headingStyle,
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => {},
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80.0,
                          child: ClipRRect(
                            child: Image.network(
                              'https://ternaengg.ac.in/wp-content/uploads/2018/06/Hon.-Dr.-Padmasinhaji-Patil-1.jpg',
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                        ),
                      ),
                      Positioned(
                          right: -30,
                          bottom: -35,
                          child: Lottie.asset('assets/lottie/award_badge.json',
                              height: 120)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text("HON. DR. PADMASINHAJI PATIL",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontFamily: 'Montserrat-Bold',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Founder President of the “Terna Public Charitable Trust”",
                  textAlign: TextAlign.center,
                  style: whiteContentStyle,
                ),
                const Divider(
                  height: 20,
                  thickness: 2,
                  color: Colors.white,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20),
                  child: SizedBox(
                    width: size.width * 0.75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          aboutPresident,
                          textAlign: TextAlign.justify,
                          style: contentStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          childCount: 1,
        ),
      ),
    );
  }

  principalSection() {
    Size size = MediaQuery.of(context).size;
    return SliverStickyHeader(
      overlapsContent: false,
      sticky: true,
      header: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff43cea2),
            Color(0xff185a9d),
          ],
        )),
        height: size.height * 0.07,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: Text(
          'Principal',
          style: headingStyle,
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80.0,
                      child: ClipRRect(
                        child: Image.network(
                          'https://ternaengg.ac.in/wp-content/uploads/2018/06/Dr.-L.-K.-Ragha.jpg',
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                    ),
                    Positioned(
                      right: -30,
                      bottom: -35,
                      child: Lottie.asset('assets/lottie/award_badge.json',
                          height: 120),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "DR. L. K. RAGHA",
                  style: cardTitleStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Principal, Terna Engineering College",
                  style: whiteContentStyle,
                ),
                const Divider(
                  height: 20,
                  thickness: 2,
                  color: Colors.white,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20),
                  child: SizedBox(
                    width: size.width * 0.75,
                    child: Column(
                      children: [
                        Text(aboutPrincipal,
                            textAlign: TextAlign.justify, style: contentStyle),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          childCount: 1,
        ),
      ),
    );
  }

  missionSection() {
    Size size = MediaQuery.of(context).size;
    return SliverStickyHeader(
      overlapsContent: false,
      sticky: true,
      header: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff43cea2),
            Color(0xff185a9d),
          ],
        )),
        height: size.height * 0.07,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: Text(
          'Mission',
          style: headingStyle,
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => SizedBox(
            width: size.width,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 270,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40, top: 130),
                    child: Text(mission,
                        textAlign: TextAlign.justify, style: contentStyle),
                  ),
                ),
                Positioned(
                  top: -15,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 150,
                    child: Lottie.asset(
                      'assets/lottie/brain_bulb_charging.json',
                    ),
                  ),
                ),
              ],
            ),
          ),
          childCount: 1,
        ),
      ),
    );
  }

  visionSection() {
    Size size = MediaQuery.of(context).size;
    return SliverStickyHeader(
      overlapsContent: false,
      sticky: true,
      header: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff43cea2),
            Color(0xff185a9d),
          ],
        )),
        height: size.height * 0.07,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: Text(
          'Vision',
          style: headingStyle,
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => SizedBox(
            width: size.width,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 300,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40, top: 150),
                    child: Text(vision,
                        textAlign: TextAlign.justify, style: contentStyle),
                  ),
                ),
                Positioned(
                  top: -0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 150,
                    child: Lottie.asset(
                      'assets/lottie/vision.json',
                    ),
                  ),
                ),
              ],
            ),
          ),
          childCount: 1,
        ),
      ),
    );
  }

  departmentSection() {
    Size size = MediaQuery.of(context).size;
    return SliverStickyHeader(
      overlapsContent: false,
      sticky: true,
      header: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff43cea2),
            Color(0xff185a9d),
          ],
        )),
        height: size.height * 0.07,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: Text(
          'Department',
          style: headingStyle,
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => SizedBox(
            height: size.height * 0.95,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                CarouselSlider(
                  items: [
                    Container(
                      width: size.width * 0.8,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: GradientColors.nightParty)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                              "COMPUTER ENGINEERING",
                              style: normalStyle,
                            ),
                          ),
                          Icon(
                            Icons.computer_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Text(
                              computerdept,
                              textAlign: TextAlign.justify,
                              style: contentStyle,
                            ),
                          ),
                          Text("Key Features", style: tabStyle),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 95.0),
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                              height: 15,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢ Strong academic environment.         ",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢ Strong interaction with Industry Compulsory Internships for students.",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 4),
                            child: Text(
                              "➢ Regular workshops for students on advanced topics.",
                              style: contentStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.8,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: GradientColors.plumBath)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                              "Information Technology",
                              style: normalStyle,
                            ),
                          ),
                          Icon(
                            Icons.laptop_chromebook_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Text(
                              itDept,
                              textAlign: TextAlign.justify,
                              style: contentStyle,
                            ),
                          ),
                          Text(
                            "Key Features",
                            style: cardTitleStyle,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 95.0),
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                              height: 15,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢  Highly qualified and experienced faculty members.",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢  Apple Lab consisting of 20 iMacs, Time capsule.",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 4),
                            child: Text(
                              "➢  Real time/life project development.",
                              style: contentStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.8,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: GradientColors.deepBlue)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                              "EXTC Engineering",
                              style: normalStyle,
                            ),
                          ),
                          Icon(
                            Icons.cable_sharp,
                            size: 30,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Text(
                              extcDept,
                              textAlign: TextAlign.justify,
                              style: contentStyle,
                            ),
                          ),
                          Text(
                            "Key Features",
                            style: cardTitleStyle,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 95.0),
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                              height: 15,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢  Qualified and Dedicated staffs 4 PhDs from IIT Bombay",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 4),
                            child: Text(
                              "➢  Cutting Edge equipment like VNA.                  ",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 4),
                            child: Text(
                              "➢  Superior EXTC Infrastructure                      ",
                              style: contentStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.8,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [Color(0xFF2871fa), Color(0xFF30b9c4)])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                              "Civil ENGINEERING",
                              style: normalStyle,
                            ),
                          ),
                          Icon(
                            Icons.architecture_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Text(
                              civilDept,
                              textAlign: TextAlign.justify,
                              style: contentStyle,
                            ),
                          ),
                          Text(
                            "Key Features",
                            style: cardTitleStyle,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 95.0),
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                              height: 15,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢  Well Equipped Laboratories.                           ",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢  Faculties with Industrial and Research experience.     ",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢  Conducts Industrial Visits.                               ",
                              style: contentStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.8,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: GradientColors.morpheusDen)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                              "Mechanical Engineering",
                              style: normalStyle,
                            ),
                          ),
                          Icon(
                            Icons.construction,
                            size: 30,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Text(
                              mechanicalDept,
                              textAlign: TextAlign.justify,
                              style: contentStyle,
                            ),
                          ),
                          Text(
                            "Key Features",
                            style: cardTitleStyle,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 95.0),
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                              height: 15,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢  Superior Machine Shop.                                  ",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢  All labs are well equipped.                                 ",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢  Well networked CAD Lab.                                     ",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 4),
                            child: Text(
                              "➢  Experienced faculty.                                         ",
                              style: contentStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.8,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: GradientColors.deepBlue)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                              "Mechatronics Engineering",
                              style: normalStyle,
                            ),
                          ),
                          const Icon(
                            Icons.engineering_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50.0),
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10),
                            child: Column(
                              children: [
                                Text(
                                  mechatronicsDeptTitle,
                                  textAlign: TextAlign.justify,
                                  style: contentStyle,
                                ),
                                Text(
                                  mechatronicsDept,
                                  textAlign: TextAlign.justify,
                                  style: contentStyle,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Key Features",
                            style: cardTitleStyle,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 95.0),
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                              height: 15,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢  6 Laboratories with ‘state of the art’ equipment..",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢  System modeling and simulation software.             ",
                              style: contentStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              "➢ Skill development through simulated virtual machines. ",
                              style: contentStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: size.height * 0.87,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          childCount: 1,
        ),
      ),
    );
  }

  policySection() {
    Size size = MediaQuery.of(context).size;
    return SliverStickyHeader(
      overlapsContent: false,
      sticky: true,
      header: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff43cea2),
            Color(0xff185a9d),
          ],
        )),
        height: size.height * 0.07,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: Text(
          'Quality Policy',
          style: headingStyle,
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: size.height * 0.80,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 40.0, right: 40, top: 150),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(quality_policy[index],
                            textAlign: TextAlign.justify, style: contentStyle),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: -0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 150,
                  child: Lottie.asset(
                    'assets/lottie/certified_ssl.json',
                  ),
                ),
              ),
            ],
          ),
          childCount: 1,
        ),
      ),
    );
  }

  valueSection() {
    Size size = MediaQuery.of(context).size;
    return SliverStickyHeader(
      overlapsContent: false,
      sticky: true,
      header: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff43cea2),
            Color(0xff185a9d),
          ],
        )),
        height: size.height * 0.07,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: Text(
          'Values',
          style: headingStyle,
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => SizedBox(
            height: size.height * 0.55,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40.0, right: 40, top: 160),
                  child: Container(
                    height: size.height * 0.25,
                    decoration: const BoxDecoration(
                        color: Colors.orange,
                        gradient:
                            LinearGradient(colors: GradientColors.coolBlues),
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(values[index],
                                  textAlign: TextAlign.justify,
                                  style: whiteContentStyle),
                            );
                          }),
                    ),
                  ),
                ),
                Positioned(
                  top: -20,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 180,
                    child: Lottie.asset(
                      'assets/lottie/earn_rewards.json',
                    ),
                  ),
                ),
              ],
            ),
          ),
          childCount: 1,
        ),
      ),
    );
  }

  contactSection() {
    Size size = MediaQuery.of(context).size;
    return SliverStickyHeader(
      overlapsContent: false,
      sticky: true,
      header: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff43cea2),
            Color(0xff185a9d),
          ],
        )),
        height: size.height * 0.07,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.center,
        child: Text('Contact Details', style: headingStyle),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => SizedBox(
            width: size.width,
            height: size.height * 0.6,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 40.0, right: 30, top: 150),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('For Admission ',
                                textAlign: TextAlign.justify,
                                style: normalStyle),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Contact: ',
                                textAlign: TextAlign.justify,
                                style: whiteContentStyle),
                            SizedBox(
                              width: 220,
                              child: Text('7406515444',
                                  textAlign: TextAlign.justify,
                                  style: contentStyle),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Email: ',
                                textAlign: TextAlign.justify,
                                style: whiteContentStyle),
                            SizedBox(
                              width: 220,
                              child: Text('admission@ternaengg.ac.in',
                                  textAlign: TextAlign.justify,
                                  style: contentStyle),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Phone: ',
                                textAlign: TextAlign.justify,
                                style: whiteContentStyle),
                            SizedBox(
                              width: 220,
                              child: Text('022-61115444',
                                  textAlign: TextAlign.justify,
                                  style: contentStyle),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Fax: ',
                                textAlign: TextAlign.justify,
                                style: whiteContentStyle),
                            SizedBox(
                              width: 220,
                              child: Text('022-61115400',
                                  textAlign: TextAlign.justify,
                                  style: contentStyle),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Email: ',
                                textAlign: TextAlign.justify,
                                style: whiteContentStyle),
                            SizedBox(
                              width: 220,
                              child: Text('info@ternaengg.ac.in',
                                  textAlign: TextAlign.justify,
                                  style: contentStyle),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Address: ',
                                textAlign: TextAlign.justify,
                                style: whiteContentStyle),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: SizedBox(
                                width: 200,
                                child: Text(
                                    'Plot No. 12, Sector-22, Opp. Nerul Railway Station, Phase-II, Nerul (W), Navi Mumbai 400706.',
                                    textAlign: TextAlign.justify,
                                    style: contentStyle),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 150,
                    child: Lottie.asset(
                      'assets/lottie/contact_mail.json',
                    ),
                  ),
                ),
              ],
            ),
          ),
          childCount: 1,
        ),
      ),
    );
  }

  locationSection() {
    Size size = MediaQuery.of(context).size;
    Set<map.Marker> _marker = {};
    _marker.add(const map.Marker(
        infoWindow: map.InfoWindow(
            title: 'Terna Engineering College', snippet: 'Engineering College'),
        markerId: map.MarkerId('terna'),
        position: map.LatLng(19.029610217581222, 73.01664309780088)));
    return SliverStickyHeader(
      overlapsContent: false,
      sticky: true,
      header: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff43cea2),
            Color(0xff185a9d),
          ],
        )),
        height: size.height * 0.07,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        alignment: Alignment.center,
        child: Text(
          'Location',
          style: headingStyle,
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => SizedBox(
            width: size.width,
            height: size.height * 0.85,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.8,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10, top: 180),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                      ),
                      child: map.GoogleMap(
                        gestureRecognizers: Set()
                          ..add(
                            Factory<PanGestureRecognizer>(
                              () => PanGestureRecognizer(),
                            ),
                          ),
                        markers: _marker,
                        initialCameraPosition: const map.CameraPosition(
                            target: map.LatLng(
                                19.029765524648372, 73.0166967420293),
                            zoom: 17),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 150,
                    child: Lottie.asset(
                      'assets/lottie/location.json',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: size.width,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3.0, bottom: 3),
                      child: Text(
                        // '© 2022 Terna Engineering College - Developed by TN04CSB19',
                        '© 2022 Terna Engineering College',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          childCount: 1,
        ),
      ),
    );
  }
}
