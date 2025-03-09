import 'package:flutter/material.dart';

class StudentCornerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Corner'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Student Resources'),
            onTap: () {
              // Navigate to Student Resources details
            },
          ),
          ListTile(
            title: Text('Student Activities'),
            onTap: () {
              // Navigate to Student Activities details
            },
          ),
          ListTile(
            title: Text('Clubs and Societies'),
            onTap: () {
              // Navigate to Clubs and Societies details
            },
          ),
          ListTile(
            title: Text('Mentorship Program'),
            onTap: () {
              // Navigate to Mentorship Program details
            },
          ),
          ListTile(
            title: Text('Student Achievements'),
            onTap: () {
              // Navigate to Student Achievements details
            },
          ),
        ],
      ),
    );
  }
}