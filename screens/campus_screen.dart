import 'package:flutter/material.dart';

class CampusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campus'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Details about the campus will be here.'),
      ),
    );
  }
}