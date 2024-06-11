import 'package:flutter/material.dart';
import 'apply_cp_opp_page.dart';

class ShowToolkitTab extends StatelessWidget {
  final String selectedCollege;
  final String studentId;
  final String studentBranch;
  ShowToolkitTab({required this.selectedCollege, required this.studentId, required this.studentBranch });

  @override
  Widget build(BuildContext context) {
    return _buildShowToolkitTab(context);
  }

  Widget _buildShowToolkitTab(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      children: [
        _buildCubeCard(
          title: 'Search',
          icon: Icons.search,
          onTap: () {
            // Navigate to search page
          },
        ),
        _buildCubeCard(
          title: 'Apply',
          icon: Icons.check_circle,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ApplyCpOppPage(
                    tabName: 'My App.',
                    selectedCollege: selectedCollege,
                    studentId: studentId,
                    studentBranch: studentBranch,
                ),
              ),
            );
                    },
        ),
        _buildCubeCard(
          title: 'Progress',
          icon: Icons.show_chart,
          onTap: () {
            // Navigate to progress page
          },
        ),
      ],
    );
  }


  Widget _buildCubeCard({required String title, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Colors.blue,
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
