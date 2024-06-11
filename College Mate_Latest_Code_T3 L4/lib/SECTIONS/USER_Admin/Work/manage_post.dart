
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ManagePostPage extends StatefulWidget {
  final String selectedCollege;
  final String selectedBranch;
  final String selectedRole;

  ManagePostPage({
    required this.selectedCollege,
    required this.selectedBranch,
    required this.selectedRole,
  });

  @override
  _ManagePostPageState createState() => _ManagePostPageState();
}

class _ManagePostPageState extends State<ManagePostPage> {
  late List<Map<String, dynamic>> postsData;

  @override
  void initState() {
    super.initState();
    postsData = [];
    _fetchData();
  }

  _fetchData() async {
    String collectionPath = 'College Mate/Institution/Colleges/${widget.selectedCollege}/DATA/${widget.selectedBranch}/${widget.selectedRole}';
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(collectionPath).get();
    setState(() {
      postsData = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Post',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff43cea2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        toolbarHeight: 80.0, // Set the height of the AppBar
      ),
      body: _buildPostList(),
    );
  }

  Widget _buildPostList() {
    if (postsData.isEmpty) {
      // return Center(child: CircularProgressIndicator());

      // Future.delayed(Duration(seconds: 3), () {
      //   if (postsData.isEmpty) {
      //     // setState(() {}); // Rebuild widget
      //     return Center(child: Text('No data to show', style: TextStyle(color: Colors.grey)));
      //   }
      // });

      return Center(child: Text('No data to show', style: TextStyle(color: Colors.grey)));
    }
    return ListView.builder(
      itemCount: postsData.length,
      itemBuilder: (context, index) {
        return PostItem(postData: postsData[index]);
      },
    );
  }
}

class PostItem extends StatefulWidget {
  final Map<String, dynamic> postData;

  PostItem({required this.postData});

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    String description = widget.postData['description'] ?? 'No description';
    String fileUrl = widget.postData['fileUrl'] ?? '';
    String adminName = widget.postData['Name'] ?? 'Unknown';
    Timestamp timestamp = widget.postData['timestamp'] ?? Timestamp.now();
    DateTime dateTime = timestamp.toDate();
    String formattedDate = DateFormat('dd/MM/yy').format(dateTime);

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    child: InkWell(
    onLongPress: () {  _showOptionsDialog(context);    },
    
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.person,
                        color: Colors.black87,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      adminName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  formattedDate,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              description,
              maxLines: showFullDescription ? null : 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            if (description.length > 30)
              TextButton(
                onPressed: () {
                  setState(() {
                    showFullDescription = !showFullDescription;
                  });
                },
                child: Text(
                  showFullDescription ? 'Read Less' : 'Read More',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            SizedBox(height: 12),
            if (fileUrl.isNotEmpty)
              Image.network(
                fileUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    )
    );
  }
}

_showOptionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Options'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Edit'),
            onTap: () {
              // Navigator.pop(context); // Close dialog
              // _navigateToEditPage();
            },
          ),
          ListTile(
            title: Text('Delete'),
            onTap: () {
              // Navigator.pop(context); // Close dialog
              // widget.onDelete();
            },
          ),
          ListTile(
            title: Text('Cancel'),
            onTap: () {
              Navigator.pop(context); // Close dialog
            },
          ),
        ],
      ),
    ),
  );
}

