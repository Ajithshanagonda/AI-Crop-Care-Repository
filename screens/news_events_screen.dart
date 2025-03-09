import 'package:flutter/material.dart';

class NewsEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News & Events'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Latest News'),
            onTap: () {
              // Navigate to Latest News details
            },
          ),
          ListTile(
            title: Text('Upcoming Events'),
            onTap: () {
              // Navigate to Upcoming Events details
            },
          ),
          ListTile(
            title: Text('Past Events'),
            onTap: () {
              // Navigate to Past Events details
            },
          ),
        ],
      ),
    );
  }
}