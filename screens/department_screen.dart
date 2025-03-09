import 'package:flutter/material.dart';
import 'department_detail_screen.dart'; // Ensure the detail screen is imported

class DepartmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Departments'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Computer Science and Engineering'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DepartmentDetailScreen(
                    departmentName: 'Computer Science and Engineering',
                    imagePath: 'lib/assets/images/cse_d.jpg',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('CSE (Artificial Intelligence & Machine Learning)'),
            onTap: () {
              // Navigate to CSE AI & ML details
            },
          ),
          ListTile(
            title: Text('Artificial Intelligence & Machine Learning (AI&ML)'),
            onTap: () {
              // Navigate to AI&ML details
            },
          ),
          ListTile(
            title: Text('Electronics and Communication Engineering'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DepartmentDetailScreen(
                    departmentName: 'Electronics and Communication Engineering',
                    imagePath: 'lib/assets/images/ece_d.jpg',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Electrical & Electronics Engineering'),
            onTap: () {
              // Navigate to EEE details
            },
          ),
          ListTile(
            title: Text('Civil Engineering'),
            onTap: () {
              // Navigate to Civil Engineering details
            },
          ),
          ListTile(
            title: Text('Mechanical Engineering'),
            onTap: () {
              // Navigate to Mechanical Engineering details
            },
          ),
          ListTile(
            title: Text('Humanities and Sciences'),
            onTap: () {
              // Navigate to Humanities and Sciences details
            },
          ),
          ListTile(
            title: Text('Master of Business Administration'),
            onTap: () {
              // Navigate to MBA details
            },
          ),
        ],
      ),
    );
  }
}