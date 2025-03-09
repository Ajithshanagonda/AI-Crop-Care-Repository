import 'package:flutter/material.dart';

class AboutUsVisionMissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vision & Mission'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Image.asset('lib/assets/images/vision_mission.jpg'),
      ),
    );
  }
}