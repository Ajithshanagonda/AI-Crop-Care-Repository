import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';

void main() {
  runApp(CropRecommendationApp());
}

class CropRecommendationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crop Recommendation',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CropRecommendationPage(),
    );
  }
}

class CropRecommendationPage extends StatefulWidget {
  @override
  _CropRecommendationPageState createState() => _CropRecommendationPageState();
}

class _CropRecommendationPageState extends State<CropRecommendationPage> {
  List<dynamic> dataset = [];
  List<String> selectedMonths = [];
  String selectedState = '';
  String selectedSoilType = '';
  List<dynamic> recommendedCrops = [];

  @override
  void initState() {
    super.initState();
    loadDataset();
  }

  Future<void> loadDataset() async {
    try {
      final data = await rootBundle.loadString('lib/assets/crop_care.json');
      setState(() {
        dataset = jsonDecode(data);
      });
    } catch (e) {
      print("Error loading dataset: $e");
    }
  }

  List<String> months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  List<String> states = [
    "Andhra Pradesh", "Maharashtra", "Punjab", "Tamil Nadu", "West Bengal",
    "Karnataka", "Uttar Pradesh", "Rajasthan", "Gujarat", "Kerala",
    "Bihar", "Odisha", "Assam", "Haryana", "Himachal Pradesh", "Jharkhand",
    "Madhya Pradesh", "Chhattisgarh", "Uttarakhand", "Sikkim", "Arunachal Pradesh",
    "Manipur", "Nagaland", "Meghalaya", "Tripura", "Mizoram", "Goa",
    "Andaman and Nicobar Islands", "Telangana"
  ];

  List<String> soilTypes = [
    "Red Soil", "Black Soil", "Alluvial Soil", "Clay Soil", "Sandy Soil", "Mountain Soil"
  ];

  void toggleMonthSelection(String month) {
    setState(() {
      if (selectedMonths.contains(month)) {
        selectedMonths.remove(month);
      } else {
        selectedMonths.add(month);
      }
    });
  }

  List<dynamic> getExactMatches() {
    return dataset.where((crop) {
      bool monthsMatch = selectedMonths.any((month) => crop['months'].contains(month));
      bool stateMatch = crop['state'] == selectedState;
      bool soilMatch = crop['soilType'] == selectedSoilType;
      return monthsMatch && stateMatch && soilMatch;
    }).toList();
  }

  List<dynamic> getPartialMatches() {
    return dataset.where((crop) {
      bool stateMatch = crop['state'] == selectedState;
      bool soilMatch = crop['soilType'] == selectedSoilType;
      return stateMatch && soilMatch;
    }).toList();
  }

  List<dynamic> getRandomCrops() {
    final random = Random();
    List<dynamic> randomCrops = [];

    if (dataset.isNotEmpty) {
      for (int i = 0; i < 3; i++) {
        randomCrops.add(dataset[random.nextInt(dataset.length)]);
      }
    }

    return randomCrops;
  }

  void getRecommendedCrops() {
    List<dynamic> filteredCrops = getExactMatches();

    if (filteredCrops.isEmpty) {
      filteredCrops = getPartialMatches();
    }
    if (filteredCrops.isEmpty) {
      filteredCrops = getRandomCrops();
    }

    setState(() {
      recommendedCrops = filteredCrops;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Recommendation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Select Duration (Months):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: months.map((month) {
                  return CheckboxListTile(
                    title: Text(month),
                    value: selectedMonths.contains(month),
                    onChanged: (bool? value) {
                      toggleMonthSelection(month);
                    },
                  );
                }).toList(),
              ),
            ),
            DropdownButton<String>(
              value: selectedState.isNotEmpty ? selectedState : null,
              hint: Text('Select State'),
              items: states.map((String state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedState = newValue!;
                });
              },
            ),
            DropdownButton<String>(
              value: selectedSoilType.isNotEmpty ? selectedSoilType : null,
              hint: Text('Select Soil Type'),
              items: soilTypes.map((String soilType) {
                return DropdownMenuItem<String>(
                  value: soilType,
                  child: Text(soilType),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedSoilType = newValue!;
                });
              },
            ),
            ElevatedButton(
              onPressed: getRecommendedCrops,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: Text(
                'Get Recommended Crops',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: recommendedCrops.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: _getGradientColors(index),
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(12),
                      title: Text(
                        recommendedCrops[index]['cropName'],
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                      ),
                      subtitle: Text(
                        'Profitability: ${recommendedCrops[index]['profitability']}',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Color> _getGradientColors(int index) {
    List<List<Color>> colorOptions = [
      [Colors.green.shade400, Colors.green.shade800],
      [Colors.blue.shade400, Colors.blue.shade800],
      [Colors.orange.shade400, Colors.orange.shade800],
      [Colors.red.shade400, Colors.red.shade800],
      [Colors.purple.shade400, Colors.purple.shade800],
      [Colors.teal.shade400, Colors.teal.shade800],
      [Colors.brown.shade400, Colors.brown.shade800],
      [Colors.pink.shade400, Colors.pink.shade800],
    ];
    return colorOptions[index % colorOptions.length];
  }
}