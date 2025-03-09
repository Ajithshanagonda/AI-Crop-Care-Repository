import 'package:flutter/material.dart';
import '../models/soil_model.dart';

class SoilDetail extends StatelessWidget {
  final Soil soil;

  SoilDetail({required this.soil});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(soil.name)),
      body: Column(
        children: [
          Image.asset(soil.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              soil.properties,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Suitable Plants: ${soil.suitablePlants}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
