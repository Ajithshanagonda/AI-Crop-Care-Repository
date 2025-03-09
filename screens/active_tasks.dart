import 'package:flutter/material.dart';
import 'task_details.dart';

class ActiveTasksPage extends StatelessWidget {
  final List<Map<String, String>> tasks = [
    {'title': 'Check soil moisture', 'status': 'Pending', 'description': 'Verify the moisture level in Farm A.'},
    {'title': 'Inspect pest infection', 'status': 'In Progress', 'description': 'Examine crop leaves for signs of pests.'},
    {'title': 'Calibrate sensors', 'status': 'Completed', 'description': 'Reconfigure the humidity and temperature sensors.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Active Tasks'), backgroundColor: Colors.green[700]),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.task, color: Colors.orange),
              title: Text(tasks[index]['title']!),
              subtitle: Text('Status: ${tasks[index]['status']}'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetailsPage(task: tasks[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
