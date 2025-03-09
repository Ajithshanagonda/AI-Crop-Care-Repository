import 'package:flutter/material.dart';
import 'plant_data.dart';
import 'plant_detail.dart';

class PlantSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Plants",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[700],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/plant_background.jpeg', // Ensure this image exists
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: plants.length,
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
                      plants[index].name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green[200],
                      backgroundImage: AssetImage(plants[index].imageUrl),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.green[700]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlantDetail(plant: plants[index]),
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
