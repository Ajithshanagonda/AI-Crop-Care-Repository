import 'package:flutter/material.dart';

class FarmDetailsPage extends StatelessWidget {
  final Map<String, String> farm;

  FarmDetailsPage({required this.farm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(farm['name']!), backgroundColor: Colors.green[700]),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📍 Location: ${farm['location']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('📏 Size: ${farm['size']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('🌱 Crop Type: Wheat', style: TextStyle(fontSize: 18)),
            Text('💧 Water Availability: Sufficient', style: TextStyle(fontSize: 18)),
            Text('🔍 Pest Control: Active Monitoring', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
