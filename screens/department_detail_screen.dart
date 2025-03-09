import 'package:flutter/material.dart';

class DepartmentDetailScreen extends StatelessWidget {
  final String departmentName;
  final String imagePath;

  DepartmentDetailScreen({required this.departmentName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(departmentName),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}