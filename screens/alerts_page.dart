import 'package:flutter/material.dart';
import 'alert_details.dart';

class AlertsPage extends StatelessWidget {
  final List<Map<String, String>> alerts = [
    {'title': 'Soil moisture low', 'description': 'Soil moisture has dropped below 30% in Farm A.'},
    {'title': 'High temperature', 'description': 'Farm C has recorded a temperature above 40°C.'},
    {'title': 'Pest infection detected', 'description': 'Signs of pest damage have been found in Farm D.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alerts & Issues'), backgroundColor: Colors.green[700]),
      body: ListView.builder(
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.warning, color: Colors.red),
              title: Text(alerts[index]['title']!),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlertDetailsPage(alert: alerts[index]),
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
