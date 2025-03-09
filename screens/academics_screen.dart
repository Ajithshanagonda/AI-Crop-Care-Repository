import 'package:flutter/material.dart';

class AcademicsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academics'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Academic Council'),
            onTap: () {
              // Navigate to Academic Council details
            },
          ),
          ListTile(
            title: Text('Courses Offered'),
            onTap: () {
              // Navigate to Courses Offered details
            },
          ),
          ListTile(
            title: Text('Admission Procedure'),
            onTap: () {
              // Navigate to Admission Procedure details
            },
          ),
          ListTile(
            title: Text('Academic Calendar'),
            onTap: () {
              // Navigate to Academic Calendar details
            },
          ),
          ListTile(
            title: Text('Human Values & Professional Ethics'),
            onTap: () {
              // Navigate to Human Values & Professional Ethics details
            },
          ),
          ListTile(
            title: Text('Achievements'),
            onTap: () {
              // Navigate to Achievements details
            },
          ),
          ListTile(
            title: Text('I&CT LMS'),
            onTap: () {
              // Navigate to I&CT LMS details
            },
          ),
          ListTile(
            title: Text('SOP'),
            onTap: () {
              // Navigate to SOP details
            },
          ),
          ListTile(
            title: Text('PO\'s PSO\'s CO\'s'),
            onTap: () {
              // Navigate to PO\'s PSO\'s CO\'s details
            },
          ),
        ],
      ),
    );
  }
}