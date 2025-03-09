import 'package:flutter/material.dart';
import '../models/plant_model.dart';

class PlantDetail extends StatelessWidget {
  final Plant plant;

  const PlantDetail({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Image.asset(plant.imageUrl),
          Expanded(
            child: ListView.builder(
              itemCount: plant.diseases.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(plant.diseases[index].name),
                  subtitle: Text(plant.diseases[index].description),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
