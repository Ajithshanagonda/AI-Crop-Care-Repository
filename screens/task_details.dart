import 'package:flutter/material.dart';

class TaskDetailsPage extends StatelessWidget {
  final Map<String, String> task;

  TaskDetailsPage({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task['title']!), backgroundColor: Colors.green[700]),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📌 Task: ${task['title']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('📝 Description: ${task['description']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('✅ Status: ${task['status']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
