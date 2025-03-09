import 'package:flutter/material.dart';
import 'soil_data.dart';
import 'soil_detail.dart';

class SoilSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Soils",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown[700],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/soil_background.jpeg', // Ensure this image exists
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: soils.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text(
                      soils[index].name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.brown[200],
                      backgroundImage: AssetImage(soils[index].imageUrl),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.brown[700]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SoilDetail(soil: soils[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
