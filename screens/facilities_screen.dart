import 'package:flutter/material.dart';

class FacilitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facilities'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: Text('Library'),
            children: [
              ListTile(
                title: Text('Library Details'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Language Lab'),
            children: [
              ListTile(
                title: Text('Language Lab Details'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Computer Center'),
            children: [
              ListTile(
                title: Text('Computer Center Details'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('E-Classrooms'),
            children: [
              ListTile(
                title: Text('E-Classrooms Details'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Seminar Halls'),
            children: [
              ListTile(
                title: Text('Seminar Halls Details'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('ATM'),
            children: [
              ListTile(
                title: Text('ATM Details'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Hostel'),
            children: [
              ListTile(
                title: Text('Hostel Details'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Medical Facility'),
            children: [
              ListTile(
                title: Text('Medical Facility Details'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Transportation'),
            children: [
              ListTile(
                title: Text('Transportation Details'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Canteen'),
            children: [
              ListTile(
                title: Text('Canteen Details'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Playground'),
            children: [
              ListTile(
                title: Text('Playground Details'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}