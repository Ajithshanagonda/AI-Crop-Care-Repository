import 'package:flutter/material.dart';
import 'farm_details.dart';

class AssignedFarmsPage extends StatelessWidget {
  final List<Map<String, String>> farms = [
    {'name': 'Farm A', 'location': 'Village X', 'size': '10 Acres'},
    {'name': 'Farm B', 'location': 'Village Y', 'size': '8 Acres'},
    {'name': 'Farm C', 'location': 'Village Z', 'size': '12 Acres'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Assigned Farms'), backgroundColor: Colors.green[700]),
      body: ListView.builder(
        itemCount: farms.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.agriculture, color: Colors.green),
              title: Text(farms[index]['name']!),
              subtitle: Text('Location: ${farms[index]['location']}'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FarmDetailsPage(farm: farms[index]),
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
