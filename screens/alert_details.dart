import 'package:flutter/material.dart';

class AlertDetailsPage extends StatelessWidget {
  final Map<String, String> alert;

  AlertDetailsPage({required this.alert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(alert['title']!), backgroundColor: Colors.green[700]),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('⚠️ Alert: ${alert['title']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('📋 Description: ${alert['description']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
