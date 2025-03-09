import 'package:flutter/material.dart';

class PlacementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placements'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Placement Cell'),
            onTap: () {
              // Navigate to Placement Cell details
            },
          ),
          ListTile(
            title: Text('Skill Enhancement Program'),
            onTap: () {
              // Navigate to Skill Enhancement Program details
            },
          ),
          ListTile(
            title: Text('TASK'),
            onTap: () {
              // Navigate to TASK details
            },
          ),
          ListTile(
            title: Text('Infosys Campus Connect'),
            onTap: () {
              // Navigate to Infosys Campus Connect details
            },
          ),
          ListTile(
            title: Text('Personal Counselling'),
            onTap: () {
              // Navigate to Personal Counselling details
            },
          ),
          ListTile(
            title: Text('Students Placed'),
            onTap: () {
              // Navigate to Students Placed details
            },
          ),
          ListTile(
            title: Text('Placements Gallery'),
            onTap: () {
              // Navigate to Placements Gallery details
            },
          ),
          ListTile(
            title: Text('Guidance for Competitive Exams'),
            onTap: () {
              // Navigate to Guidance for Competitive Exams details
            },
          ),
        ],
      ),
    );
  }
}