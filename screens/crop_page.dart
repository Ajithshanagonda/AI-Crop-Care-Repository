import 'package:flutter/material.dart';
import '../crop_data.dart'; // Ensure correct import path
import '../models/crop_model.dart';

class CropPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crops'),
      ),
      body: ListView.builder(
        itemCount: crops.length,
        itemBuilder: (context, index) {
          final crop = crops[index];
          return ListTile(
            title: Text(crop.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Disease: ${crop.disease}'),
                Text('Pesticide: ${crop.pesticide}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
