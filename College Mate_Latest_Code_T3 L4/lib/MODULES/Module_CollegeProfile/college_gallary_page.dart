// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:mech_it/UTILS/constants/colors.dart';
// import 'package:mech_it/UTILS/imageview/imageViewer.dart';
//
// class GallaryPage extends StatefulWidget {
//   final String? selectedCollege;
//   final String? studentBranch;
//   final String? studentId;
//
//   GallaryPage({
//     Key? key,
//     this.selectedCollege,
//     this.studentId,
//     this.studentBranch,
//   }) : super(key: key);
//
//   List<String> category = [
//     'IMP',
//     'ANTRANG',
//     'AVALON',
//     'NSS',
//     'REVIVE',
//     'RESONANCE',
//     'SPORTEC',
//     'EVENTS',
//     'FESTS',
//     'TRAINING & PLACEMENT',
//   ];
//
//   List<String> guestCategory = [
//     'ANTRANG',
//     'AVALON',
//     'NSS',
//     'REVIVE',
//     'RESONANCE',
//     'SPORTEC',
//     'EVENTS',
//     'FESTS',
//   ];
//
//   List<String> guestBranch = [
//     'All',
//     'AIDS',
//     'Civil',
//     'Computer',
//     'EXTC',
//     'IT',
//     'Mechanic',
//     'Mechatronics',
//   ];
//
//   List<String> years = ['2024', '2023', '2022', '2021'];
//
//   get branch => null;
//
//   @override
//   _GallaryPageState createState() => _GallaryPageState();
// }
//
// class _GallaryPageState extends State<GallaryPage>
//     with SingleTickerProviderStateMixin {
//   late String selectedCategory;
//   late String selectedBranch;
//   late String selectedYear;
//
//   late TabController _tabController;
//   late List<Map<String, dynamic>> postsData;
//   late List<String> displayedCategories;
//   late List<String> displayedBranches;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedYear = widget.years.first;
//
//     if (widget.studentBranch == 'Guest Screen' || widget.studentId == 'Guest Mode') {
//       selectedCategory = widget.guestCategory.first;
//       selectedBranch = widget.guestBranch.first;
//       displayedCategories = widget.guestCategory;
//       displayedBranches = widget.guestBranch;
//     } else {
//       selectedCategory = widget.category.first;
//       selectedBranch = widget.branch.first;
//       displayedCategories = widget.category;
//       displayedBranches = widget.branch;
//     }
//
//     _tabController = TabController(length: 1, vsync: this);
//     postsData = [];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(122),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: customLinearGradient(),
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: AppBar(
//             elevation: 10,
//             backgroundColor: Colors.transparent,
//             title: Text(
//               widget.studentBranch == 'Guest Screen' || widget.studentId == 'Guest Mode'
//                   ? 'Campus Events'
//                   : 'Campus Fusion',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//             centerTitle: true,
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(60),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SizedBox(width: 10),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _showCategorySelectionDialog();
//                       },
//                       icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                       label: Text('$selectedCategory'),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         padding: EdgeInsets.fromLTRB(0, 10, 4, 10),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _showBranchSelectionDialog();
//                       },
//                       icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                       label: Text('$selectedBranch'),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         padding: EdgeInsets.fromLTRB(0, 10, 4, 10),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _showYearSelectionDialog();
//                       },
//                       icon: Icon(Icons.arrow_drop_down, color: Colors.black),
//                       label: Text('$selectedYear'),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         padding: EdgeInsets.fromLTRB(0, 10, 4, 10),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                   ].map((widget) => Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: widget,
//                   )).toList(),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         primary: false,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 10),
//             _fetchDataFromFirebase(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _fetchDataFromFirebase() {
//     String collectionPath =
//         'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA/${selectedBranch}/${selectedCategory}';
//
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection(collectionPath).snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         if (snapshot.hasError) {
//           return Center(child: Text('\n\n\n\n\n\n\n\n\n\nError fetching data: ${snapshot.error}'));
//         }
//
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Center(child: Text('\n\n\n\n\n\n\n\n\n\nNo data available', style: TextStyle(fontSize: 18)));
//         }
//
//         List<QueryDocumentSnapshot> dataDocs = snapshot.data!.docs;
//         return _buildDisplayImages(dataDocs);
//       },
//     );
//   }
//
//   Widget _buildDisplayImages(List<QueryDocumentSnapshot> dataDocs) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 0.75,
//       ),
//       itemCount: dataDocs.length,
//       itemBuilder: (context, index) {
//         return ImageItem(imageData: dataDocs[index].data() as Map<String, dynamic>);
//       },
//       padding: EdgeInsets.all(8),
//     );
//   }
//
//   _showCategorySelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Category'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: displayedCategories.map((category) {
//                 return ListTile(
//                   title: Text(category),
//                   onTap: () {
//                     setState(() {
//                       selectedCategory = category;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   _showBranchSelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Branch'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: displayedBranches.map((branch) {
//                 return ListTile(
//                   title: Text(branch),
//                   onTap: () {
//                     setState(() {
//                       selectedBranch = branch;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   _showYearSelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Year'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: widget.years.map((year) {
//                 return ListTile(
//                   title: Text(year),
//                   onTap: () {
//                     setState(() {
//                       selectedYear = year;
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
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
//
// class ImageItem extends StatelessWidget {
//   final Map<String, dynamic> imageData;
//
//   ImageItem({required this.imageData});
//
//   @override
//   Widget build(BuildContext context) {
//     String imageUrl = imageData['fileUrl'] ?? '';
//
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ImageViewer(imgpath: imageUrl),
//           ),
//         );
//       },
//       child: Container(
//         margin: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3),
//               spreadRadius: 1,
//               blurRadius: 4,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Image.network(
//             imageUrl,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//














import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mech_it/UTILS/constants/colors.dart';
import 'package:mech_it/UTILS/imageview/imageViewer.dart';

class GallaryPage extends StatefulWidget {
  final String? selectedCollege;
  final String? studentBranch;
  final String? studentId;

  GallaryPage({
    Key? key,
    this.selectedCollege,
    this.studentId,
    this.studentBranch,
  }) : super(key: key);

  final List<String> category = [
    'IMP', 'ANTRANG', 'AVALON', 'NSS', 'REVIVE',
    'RESONANCE', 'SPORTEC', 'EVENTS', 'FESTS', 'TRAINING & PLACEMENT'
  ];

  final List<String> guestCategory = [
    'ANTRANG', 'AVALON', 'NSS', 'REVIVE',
    'RESONANCE', 'SPORTEC', 'EVENTS', 'FESTS'
  ];

  final List<String> guestBranch = [
    'All', 'AIDS', 'Civil', 'Computer',
    'EXTC', 'IT', 'Mechanic', 'Mechatronics'
  ];

  final List<String> years = ['2024', '2023', '2022', '2021'];

  @override
  _GallaryPageState createState() => _GallaryPageState();
}

class _GallaryPageState extends State<GallaryPage>
    with SingleTickerProviderStateMixin {
  late String selectedCategory;
  late String selectedBranch;
  late String selectedYear;

  late TabController _tabController;
  late List<Map<String, dynamic>> postsData;
  late List<String> displayedCategories;
  late List<String> displayedBranches;

  @override
  void initState() {
    super.initState();
    selectedYear = widget.years.first;

    if (widget.studentBranch == 'Guest Screen' || widget.studentId == 'Guest Mode') {
      selectedCategory = widget.guestCategory.first;
      selectedBranch = widget.guestBranch.first;
      displayedCategories = widget.guestCategory;
      displayedBranches = widget.guestBranch;
    } else {
      selectedCategory = widget.category.first;
      selectedBranch = widget.guestBranch.first;
      displayedCategories = widget.category;
      displayedBranches = widget.guestBranch;
    }

    _tabController = TabController(length: 1, vsync: this);
    postsData = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customLinearGradient().colors.last,
        title: Text(
          widget.studentBranch == 'Guest Screen' || widget.studentId == 'Guest Mode'
              ? 'Campus Events'
              : 'Campus Fusion',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDropdownButton('Category', displayedCategories, selectedCategory, _showCategorySelectionDialog),
                _buildDropdownButton('Branch', displayedBranches, selectedBranch, _showBranchSelectionDialog),
                _buildDropdownButton('Year', widget.years, selectedYear, _showYearSelectionDialog),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        primary: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            _fetchDataFromFirebase(),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton(String title, List<String> items, String selectedItem, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
        label: Text('$selectedItem'),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _fetchDataFromFirebase() {
    String collectionPath =
        'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA/${selectedBranch}/${selectedCategory}';

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection(collectionPath).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error fetching data: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No data available', style: TextStyle(fontSize: 18)));
        }

        List<QueryDocumentSnapshot> dataDocs = snapshot.data!.docs;
        return _buildDisplayImages(dataDocs);
      },
    );
  }

  Widget _buildDisplayImages(List<QueryDocumentSnapshot> dataDocs) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: dataDocs.length,
      itemBuilder: (context, index) {
        return ImageItem(imageData: dataDocs[index].data() as Map<String, dynamic>);
      },
      padding: EdgeInsets.all(16),
    );
  }

  _showCategorySelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return _buildSelectionDialog('Select Category', displayedCategories, selectedCategory, (category) {
          setState(() {
            selectedCategory = category;
          });
          Navigator.of(context).pop();
        });
      },
    );
  }

  _showBranchSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return _buildSelectionDialog('Select Branch', displayedBranches, selectedBranch, (branch) {
          setState(() {
            selectedBranch = branch;
          });
          Navigator.of(context).pop();
        });
      },
    );
  }

  _showYearSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return _buildSelectionDialog('Select Year', widget.years, selectedYear, (year) {
          setState(() {
            selectedYear = year;
          });
          Navigator.of(context).pop();
        });
      },
    );
  }

  AlertDialog _buildSelectionDialog(String title, List<String> items, String selectedItem, Function(String) onSelect) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: items.map((item) {
            return ListTile(
              title: Text(item),
              onTap: () {
                onSelect(item);
              },
            );
          }).toList(),
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

class ImageItem extends StatelessWidget {
  final Map<String, dynamic> imageData;

  ImageItem({required this.imageData});

  @override
  Widget build(BuildContext context) {
    String imageUrl = imageData['fileUrl'] ?? '';

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageViewer(imgpath: imageUrl),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ImageViewer extends StatelessWidget {
  final String imgpath;

  ImageViewer({required this.imgpath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.network(imgpath),
      ),
    );
  }
}
